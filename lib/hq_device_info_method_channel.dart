
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'hq_device_info_platform_interface.dart';

/// An implementation of [HqDeviceInfoPlatform] that uses method channels.
/// 实现抽象类中的方法
class MethodChannelHqDeviceInfo extends HqDeviceInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hq_device_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<Map<String, dynamic>?> deviceInfo() async {
    /*
    //注意原生的返回类型
    base_type: await methodChannel.invokeMethod<T>(String method,[dynamic arguments])
    map: await methodChannel.invokeMapMethod<String,dynamic>(String method,[dynamic arguments])
    list: await methodChannel.invokeListMethod<dynamic>(String method,[dynamic arguments])
     */
    
    final info = await methodChannel.invokeMapMethod<String,dynamic>('deviceInfo');
    return info;
  }
  //设置回调监听原生调用flutter
  @override
  void setMethodCallHandler(Future Function(MethodCall call)? handler) {
    methodChannel.setMethodCallHandler(handler);
    // super.setMethodCallHandler(handler);
  }
}
