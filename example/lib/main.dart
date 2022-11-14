import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hq_device_info/hq_device_info.dart';

void main() {
  runApp(const HqRootApp());
}

class HqRootApp extends StatelessWidget {
  const HqRootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceInfo = 'Unknown';

  final _hqDeviceInfoPlugin = HqDeviceInfo();

  @override
  void initState() {
    super.initState();
    //监听原生调用
    _hqDeviceInfoPlugin.setMethodCallHandler((call) {
      if (call.method == 'showAlert') {
        debugPrint('监听到原生调用');
        _showDialog(context);
      }
      return Future.value(() {});
    });
  }

  AlertDialog _alertDialog() {
    return AlertDialog(
      content: const Text('DartAlert'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('close'))
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _alertDialog();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Running on: $_deviceInfo\n'),
          ElevatedButton(
              onPressed: () async {
                // _showSheet(context);
                var dif = await _hqDeviceInfoPlugin.deviceInfo();
                setState(() {
                  _deviceInfo = dif.toString();
                });
              },
              child: const Text('获取设备信息')),
        ],
      )),
    );
  }
}

/*
flutter create --template=plugin --platforms=android -a java .
 */