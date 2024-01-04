import 'wxpay_platform_interface.dart';

class Wxpay {
  Future<String?> getPlatformVersion() {
    return WxpayPlatform.instance.getPlatformVersion();
  }

  Future<void> init(Function callback) async {
    WxpayPlatform.instance.init(callback);
  }
  Future<void> payH5(String url) async {
    WxpayPlatform.instance.payH5(url);
  }

  Future<void> payJsapi(Map<String,dynamic> config) async {
    WxpayPlatform.instance.payJsapi(config);
  }

}
