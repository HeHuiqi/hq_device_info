import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hq_device_info/hq_device_info_method_channel.dart';

void main() {
  MethodChannelHqDeviceInfo platform = MethodChannelHqDeviceInfo();
  const MethodChannel channel = MethodChannel('hq_device_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
