import 'package:flutter_test/flutter_test.dart';
import 'package:wxpay/wxpay.dart';
import 'package:wxpay/wxpay_platform_interface.dart';
import 'package:wxpay/wxpay_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWxpayPlatform
    with MockPlatformInterfaceMixin
    implements WxpayPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');



  @override
  Future<void> payH5() {
    // TODO: implement payH5
    throw UnimplementedError();
  }

  @override
  Future<void> payJsapi() {
    // TODO: implement payJsapi
    throw UnimplementedError();
  }

  @override
  Future<void> init(Function callback) {
    // TODO: implement init
    throw UnimplementedError();
  }
}

void main() {
  final WxpayPlatform initialPlatform = WxpayPlatform.instance;

  test('$MethodChannelWxpay is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWxpay>());
  });

  test('getPlatformVersion', () async {
    Wxpay wxpayPlugin = Wxpay();
    MockWxpayPlatform fakePlatform = MockWxpayPlatform();
    WxpayPlatform.instance = fakePlatform;

    expect(await wxpayPlugin.getPlatformVersion(), '42');
  });
}
