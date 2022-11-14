import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart';
import 'hq_device_info_method_channel.dart';
// 通过抽象类定义接口
abstract class HqDeviceInfoPlatform extends PlatformInterface {
  /// Constructs a HqDeviceInfoPlatform.
  HqDeviceInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static HqDeviceInfoPlatform _instance = MethodChannelHqDeviceInfo();

  /// The default instance of [HqDeviceInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelHqDeviceInfo].
  static HqDeviceInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HqDeviceInfoPlatform] when
  /// they register themselves.
  static set instance(HqDeviceInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<Map<String,dynamic>?> deviceInfo() {
    throw UnimplementedError('deficeInfo() has not been implemented.');
  }
  void setMethodCallHandler(Future<dynamic> Function(MethodCall call)? handler){
        throw UnimplementedError('setMethodCallHandler() has not been implemented.');
  }
}
