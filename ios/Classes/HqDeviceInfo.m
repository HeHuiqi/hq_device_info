//
//  HqDeviceInfo.m
//  Pods
//
//  Created by hehuiqi on 2022/10/18.
//

#import "HqDeviceInfo.h"

@implementation HqDeviceInfo

+ (NSDictionary *)deviceInfo{
    UIDevice* device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    int batteryLevel = (device.batteryLevel * 100);;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        batteryLevel = -1;
    }
    return @{@"batteryLevel":@(batteryLevel),
             @"systemVersion":device.systemVersion,
             @"systemName":device.systemName,
             @"phoneModel":device.model,
    };
}

@end
