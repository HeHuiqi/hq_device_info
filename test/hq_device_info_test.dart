import 'package:flutter/src/services/message_codec.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hq_device_info/hq_device_info.dart';
import 'package:hq_device_info/hq_device_info_platform_interface.dart';
import 'package:hq_device_info/hq_device_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHqDeviceInfoPlatform
    with MockPlatformInterfaceMixin
    implements HqDeviceInfoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<Map<String, dynamic>?> deviceInfo() {
    throw Future.value({"deviceType:","iOS"});
  }

  @override
  void setMethodCallHandler(Future Function(MethodCall call)? handler) {
    // TODO: implement setMethodCallHandler
  }
  

}

void main() {
  final HqDeviceInfoPlatform initialPlatform = HqDeviceInfoPlatform.instance;

  test('$MethodChannelHqDeviceInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHqDeviceInfo>());
  });

  test('getPlatformVersion', () async {
    HqDeviceInfo hqDeviceInfoPlugin = HqDeviceInfo();
    MockHqDeviceInfoPlatform fakePlatform = MockHqDeviceInfoPlatform();
    HqDeviceInfoPlatform.instance = fakePlatform;

    expect(await hqDeviceInfoPlugin.getPlatformVersion(), '42');
  });
}
