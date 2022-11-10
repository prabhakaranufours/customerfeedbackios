import 'dart:io';
import 'package:uuid/uuid.dart';

import 'package:datetime_setting/datetime_setting.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safe_device/safe_device.dart';
import 'package:connectivity/connectivity.dart';

import '../widgets/button.dart';

var connectivity = Connectivity();
Future<bool> isNetworkAvailable() async {
  bool res =
      (await connectivity.checkConnectivity()) != ConnectivityResult.none;
  // if (!res) showNetworkError();
  return res;
}

String getDate({String format = 'dd/MM/yyyy', DateTime? dateTime}) {
  return DateFormat(format).format(dateTime ?? DateTime.now());
}


int getDifferenceInSecond(String startDate, String endDate, String format){
  try {
    return DateFormat(format)
        .parse(endDate)
        .difference(DateFormat(format).parse(startDate))
        .inSeconds;
  }catch(e){
    debugPrint(e.toString());
    return -1;
  }
}

Future<String?> getDeviceUniqueId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
  return null;
}

String getCustomUniqueId() {
  var uuid = Uuid();
  return uuid.v1();
}

checkTimeSetting(BuildContext context) async {
  if (!await DatetimeSetting.timeIsAuto()) {
    await showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => await DatetimeSetting.timeIsAuto(),
            child: Container(
              height: 190,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Security Warning!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Network provided time is disabled. Please enable the same to proceed further.',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                      width: 100,
                      buttonText: 'Setting',
                      onPressed: () {
                        DatetimeSetting.openSetting();
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

checkRootedDevice(BuildContext context) async {
  if ((await SafeDevice.isJailBroken) || !(await SafeDevice.isRealDevice)) {
    await showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Container(
              height: 150,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Security Warning!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'This application is not supported your device. please contact admin.',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
