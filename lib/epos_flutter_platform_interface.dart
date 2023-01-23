import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'epos_flutter_method_channel.dart';

abstract class EposFlutterPlatform extends PlatformInterface {
  /// Constructs a EposFlutterPlatform.
  EposFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static EposFlutterPlatform _instance = MethodChannelEposFlutter();

  /// The default instance of [EposFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelEposFlutter].
  static EposFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EposFlutterPlatform] when
  /// they register themselves.
  static set instance(EposFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> startPrinterDiscovery() {
    throw UnimplementedError(
        'startPrinterDiscovery() has not been implemented.');
  }
  Future<String?> stopPrinterDiscovery() {
    throw UnimplementedError(
        'stopPrinterDiscovery() has not been implemented.');
  }
  Future<String?> printToPrinter({List<Map<String, dynamic>>? list, String? printer, int? printerSeries}) {
    throw UnimplementedError(
        'startPrinterDiscovery() has not been implemented.');
  }
}
