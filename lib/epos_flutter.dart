import 'package:flutter/services.dart';

import 'epos_flutter_platform_interface.dart';
export 'src/models/printer.dart';

class EposFlutter {
  MethodChannel channel = const MethodChannel('epos_flutter');

  Future<String?> getPlatformVersion() {
    return EposFlutterPlatform.instance.getPlatformVersion();
  }

  Future<String?> startPrinterDiscovery() {
    return EposFlutterPlatform.instance.startPrinterDiscovery();
  }

  Future<String?> stopPrinterDiscovery() {
    return EposFlutterPlatform.instance.stopPrinterDiscovery();
  }

  Future<String?> printToPrinter({required List<Map<String, dynamic>> list, String? printer, required int printerSeries}) {
    return EposFlutterPlatform.instance.printToPrinter();
  }

  void setMethodCallHandler(Future<dynamic> Function(MethodCall call) handler) {
    channel.setMethodCallHandler((handler));
  }
}
