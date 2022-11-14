package com.example.hq_device_info;


import android.os.Build;
import java.util.HashMap;

public class HqDeviceInfo {


    static HashMap deviceInfo(){

        HashMap info = new HashMap<>();
        String systemVersion = Build.VERSION.RELEASE;
        String systemName = Build.DISPLAY;
        String brand = Build.BOARD;
        String model = Build.MODEL;
        int sdkInt = Build.VERSION.SDK_INT;
        info.put("systemVersion",systemVersion);
        info.put("phoneModel",model);
        info.put("systemName",systemName);
        info.put("brand",brand);
        info.put("sdkInt",sdkInt);




        return  info;
    }
}
