import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wxpay_platform_interface.dart';

/// An implementation of [WxpayPlatform] that uses method channels.
class MethodChannelWxpay extends WxpayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wxpay');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> init(Function callback) async {
    await methodChannel.invokeMethod('init',[callback]);
  }
}
