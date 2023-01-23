import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'epos_flutter_platform_interface.dart';

/// An implementation of [EposFlutterPlatform] that uses method channels.
class MethodChannelEposFlutter extends EposFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('epos_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> startPrinterDiscovery() async {
    final printerDiscovery =
        await methodChannel.invokeMethod('startPrinterDiscovery');
    return printerDiscovery;
  }

  @override
  Future<String?> stopPrinterDiscovery() async {
    final stopPrinter =
        await methodChannel.invokeMethod('stopPrinterDiscovery');
    return stopPrinter;
  }

  @override
  Future<String?> printToPrinter(
      {List<Map<String, dynamic>>? list,
      String? printer,
      int? printerSeries}) async {
    final result = await methodChannel.invokeMethod('printList',
        {'list': list, 'printer': printer, 'printerSeries': printerSeries});
    return result;
  }



}
