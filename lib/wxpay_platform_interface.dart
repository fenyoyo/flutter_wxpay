import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wxpay_method_channel.dart';

abstract class WxpayPlatform extends PlatformInterface {
  /// Constructs a WxpayPlatform.
  WxpayPlatform() : super(token: _token);

  static final Object _token = Object();

  static WxpayPlatform _instance = MethodChannelWxpay();

  /// The default instance of [WxpayPlatform] to use.
  ///
  /// Defaults to [MethodChannelWxpay].
  static WxpayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WxpayPlatform] when
  /// they register themselves.
  static set instance(WxpayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> init( Function callback) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<void> payH5(String url) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<void> payJsapi(Map<String,dynamic> config) {
    throw UnimplementedError('init() has not been implemented.');
  }
}
