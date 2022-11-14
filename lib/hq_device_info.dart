
import 'package:flutter/services.dart';
import 'hq_device_info_platform_interface.dart';

class HqDeviceInfo {
  Future<String?> getPlatformVersion() {
    return HqDeviceInfoPlatform.instance.getPlatformVersion();
  }
  Future<Map<String,dynamic>?> deviceInfo() {
    return HqDeviceInfoPlatform.instance.deviceInfo();
  }
  //设置回调监听原生调用flutter
  void setMethodCallHandler(Future Function(MethodCall call)? handler) {
        return HqDeviceInfoPlatform.instance.setMethodCallHandler(handler);
  }
}
