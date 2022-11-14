#import "HqDeviceInfoPlugin.h"
#import "HqDeviceInfo.h"



@interface HqDeviceInfoPlugin ()

@property (nonatomic,strong) FlutterMethodChannel *channel;
@end

@implementation HqDeviceInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"hq_device_info"
                                     binaryMessenger:[registrar messenger]];
    HqDeviceInfoPlugin* instance = [[HqDeviceInfoPlugin alloc] init];
    instance.channel = channel;
    [registrar addMethodCallDelegate:instance channel:channel];
}
#pragma mark - FlutterPlugin 处理Flutter调用
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    }else if ([@"deviceInfo" isEqualToString:call.method]){
        
        result([HqDeviceInfo deviceInfo]);
        
        
        //调用Flutter方法
        [self.channel invokeMethod:@"showAlert" arguments:nil];
        
        /*
        UIAlertController *alerc = [UIAlertController alertControllerWithTitle:@"NativeAlert" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *ac = [UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            //调用Flutter方法
            [self.channel invokeMethod:@"showAlert" arguments:nil];
            
        }];
        [alerc addAction:ac];
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window.rootViewController presentViewController:alerc animated:YES completion:nil];
        */
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

@end
