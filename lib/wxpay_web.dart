// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window, ScriptElement, document;
import 'dart:js' as js show context, allowInterop;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'wxpay_platform_interface.dart';

/// A web implementation of the WxpayPlatform of the Wxpay plugin.
class WxpayWeb extends WxpayPlatform {
  /// Constructs a WxpayWeb
  WxpayWeb();

  late Function _callback;

  static void registerWith(Registrar registrar) {
    WxpayPlatform.instance = WxpayWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  @override
  Future<void> init(callback) async {
    _callback = callback;
    var script = html.ScriptElement();
    script.innerHtml = getScript();
    html.document.head!.append(script);
    js.context['onWeChatPayResult'] = js.allowInterop(weChatPayResultCallback);
  }

  void weChatPayResultCallback(String result) {
    _callback;
  }

  @override
  Future<void> payH5(url) {
    html.window.location.href = url;
    return Future(() => null);
  }

  @override
  Future<void> payJsapi(config) {
    // TODO: implement payJsapi
    js.context.callMethod('onBridgeReady', [
      config['appId'],
      config['timeStamp'],
      config['nonceStr'],
      config['package'],
      config['signType'],
      config['paySign'],
    ]);
    return Future(() => null);
  }

  getScript() {
    var script = """
    function onBridgeReady(appId, timeStamp, nonceStr, package, signType, paySign) {
    WeixinJSBridge.invoke('getBrandWCPayRequest', {
        "appId": appId,   //公众号ID，由商户传入
        "timeStamp": timeStamp,//时间戳，自1970年以来的秒数
        "nonceStr": nonceStr,      //随机串
        "package": package,
        "signType": signType,     //微信签名方式：
        "paySign": paySign
    },
        function (res) {
            if (res.err_msg == "get_brand_wcpay_request:ok") {
                // 使用以上方式判断前端返回,微信团队郑重提示：
                //res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。
            }
            onWeChatPayResult(res.err_msg)
        });
}
    """;
    return script;
  }
}
