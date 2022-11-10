

import 'package:permission_handler/permission_handler.dart';

Future<bool> isHaveStoragePermission() async{
  if(await Permission.storage.isGranted){
    return true;
  }else{
    requestStoragePermission();
    return false;
  }
}

requestStoragePermission() async {
  var result=await Permission.storage.request();
  if(result==PermissionStatus.permanentlyDenied){
    //show alert for storage permission
  }else if(result==PermissionStatus.denied){
    //re request with proper message
    requestStoragePermission();
  }
}

Future<bool> isHaveCameraPermission() async {
 if(await Permission.camera.isGranted){
   return true;
 }else{
   requestCameraPermission();
   return false;
 }
}

requestCameraPermission() async {
  var result=await Permission.camera.request();
  if(result==PermissionStatus.permanentlyDenied){
    //show alert for storage permission
    openAppSettings();
  }else if(result==PermissionStatus.denied){
    //re request with proper message
    requestCameraPermission();
  }
}