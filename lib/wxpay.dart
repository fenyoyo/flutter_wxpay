import 'wxpay_platform_interface.dart';

class Wxpay {
  Future<String?> getPlatformVersion() {
    return WxpayPlatform.instance.getPlatformVersion();
  }

  Future<void> init(Function callback) async {
    WxpayPlatform.instance.init(callback);
  }
}
