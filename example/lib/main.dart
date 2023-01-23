import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:epos_flutter/epos_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _printerDiscoveryState = 'None';
  final List<Printer> _printerList = [];
  final _eposFlutterPlugin = EposFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initCallbackHandler();
  }

  void initCallbackHandler() {
    _eposFlutterPlugin.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'flutter_esc_pos#deviceInfo':
          print(call.arguments);
          setState(() {
            Printer printer = Printer();
            printer.target = call.arguments['target'];
            printer.ipAddress = call.arguments['ipAddress'];
            printer.macAddress = call.arguments['macAddress'];
            printer.bdAddress = call.arguments['bdAddress'];
            printer.deviceName = call.arguments['deviceName'];
            printer.deviceType = call.arguments['deviceType'];
            printer.printerType = call.arguments['printerType'];
            printer.printerSeries = call.arguments['printerSeries'];
            printer.connectionType = call.arguments['connectionType'];
            _printerList.add(printer);
          });
          break;
        default:
          print(
              "Callback Method Not Found: ${call.method}\nArguments: ${call.arguments}");
      }
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String printerDiscoveryState;
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _eposFlutterPlugin.getPlatformVersion() ??
          'Unknown platform version';
      printerDiscoveryState =
          (await _eposFlutterPlugin.startPrinterDiscovery())!;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      printerDiscoveryState = 'Failed to get Printer Discovery State';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _printerDiscoveryState = printerDiscoveryState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text('Printer Discovery State: $_printerDiscoveryState\n'),
              const Divider(),
              const Text('Printers:\n'),
              for (Printer printer in _printerList)
                Text(
                    '${printer.deviceName}\n${printer.macAddress}\n${printer.printerSeries}\n${printer.connectionType}\n\n'),
              const Divider(),
              ElevatedButton(
                child: const Text("Print"),
                onPressed: () async {
                  for (Printer printer in _printerList) {
                    List<Map<String, dynamic>> list = [];
                    list.add(PrintText('Hello Printer ${printer.deviceName}')
                        .toMap());
                    list.add(PrintLine(1).toMap());
                    list.add(PrintTextCenter('${printer.ipAddress}').toMap());
                    list.add(PrintTextCenter('${printer.macAddress}').toMap());
                    list.add(PrintTextCenter('${printer.target}').toMap());
                    list.add(PrintLine(2).toMap());
                    list.add(PrintTextRight('this is on right!').toMap());
                    list.add(PrintLine(4).toMap());
                    list.add(PrintFeed(10).toMap());
                    list.add(PrintCut(1).toMap());
                    print(list);
                    String result = (await _eposFlutterPlugin.printToPrinter(
                        list: list,
                        printer: printer.target,
                        printerSeries: printer.printerSeries!))!;
                    // await _eposFlutterPlugin.printToPrinter(
                    //     list: list,
                    //     printer: printer.target!,
                    //     printerSeries: printer.printerSeries!);
                    print(result);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
