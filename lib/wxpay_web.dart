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
    html.ScriptElement().src = 'packages/wxpay/assets/js/wxpay.js';
    html.document.head!.append(html.ScriptElement());

    js.context['onWeChatPayResult'] = js.allowInterop(weChatPayResultCallback);
    // js.context.callMethod('onBridgeReady', [
    //   body['data']['pay_config']['appId'],
    //   body['data']['pay_config']['timeStamp'],
    //   body['data']['pay_config']['nonceStr'],
    //   body['data']['pay_config']['package'],
    //   body['data']['pay_config']['signType'],
    //   body['data']['pay_config']['paySign'],
    // ]);
  }

  void weChatPayResultCallback(String result) {
    _callback;
  }

  @override
  Future<void> payH5() {
    // TODO: implement payH5
    return super.payH5();
  }
  @override
  Future<void> payJsapi() {
    // TODO: implement payJsapi
    return super.payJsapi();
  }
}
