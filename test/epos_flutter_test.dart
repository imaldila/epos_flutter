import 'package:flutter_test/flutter_test.dart';
import 'package:epos_flutter/epos_flutter.dart';
import 'package:epos_flutter/epos_flutter_platform_interface.dart';
import 'package:epos_flutter/epos_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEposFlutterPlatform
    with MockPlatformInterfaceMixin
    implements EposFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> startPrinterDiscovery() => Future.value('1');

  @override
  Future<String?> printToPrinter(
      {List<Map<String, dynamic>>? list, String? printer, int? printerSeries}) {
    throw UnimplementedError();
  }

  @override
  Future<String?> stopPrinterDiscovery() {
    throw UnimplementedError();
  }
  
  @override
  void setMethodCallHandler() {
    // TODO: implement setMethodCallHandler
  }
}

void main() {
  final EposFlutterPlatform initialPlatform = EposFlutterPlatform.instance;

  test('$MethodChannelEposFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEposFlutter>());
  });

  test('getPlatformVersion', () async {
    EposFlutter eposFlutterPlugin = EposFlutter();
    MockEposFlutterPlatform fakePlatform = MockEposFlutterPlatform();
    EposFlutterPlatform.instance = fakePlatform;

    expect(await eposFlutterPlugin.getPlatformVersion(), '42');
  });
  test('startPrinterDiscovery', () async {
    EposFlutter eposFlutterPlugin = EposFlutter();
    MockEposFlutterPlatform fakePlatform = MockEposFlutterPlatform();
    EposFlutterPlatform.instance = fakePlatform;

    expect(await eposFlutterPlugin.startPrinterDiscovery(), '1');
  });
}
