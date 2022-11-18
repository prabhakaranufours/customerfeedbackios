import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common_functions.dart';

enum ImageReturnType {
  filePath,
  uInt8List,
  base64,
}

enum PickerOption {
  camera,
  gallery,
  all,
}

const String camMsg = "iFazig would like access to capture asset image";
const String photoMsg =
    "iFazig would like access to your photo gallery for getting asset image";

Future<dynamic> getImage(
    BuildContext context, {
      PickerOption pickerOption = PickerOption.camera,
      ImageReturnType returnType = ImageReturnType.filePath,
      bool pickMultiple = false,
      bool canDrawDateTime = false,
      double maxWidth = 200,
      double maxHeight = 200,
      int quality = 50,
    }) async {
  if (pickerOption == PickerOption.gallery ||
      pickerOption == PickerOption.all) {
    var status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      if (Platform.isIOS) {
        showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Photo Permission'),
              content: Text(photoMsg),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Deny'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoDialogAction(
                  child: const Text('Settings'),
                  onPressed: () => openAppSettings(),
                ),
              ],
            ));
      } else {
        showToastMsg('Gallery Permission Required');
        if (await Permission.storage.isPermanentlyDenied) {
          openAppSettings();
        } else {
          await Permission.photos.request();
        }
      }
      return null;
    }
  }

  if (pickerOption == PickerOption.camera || pickerOption == PickerOption.all) {
    var status = await Permission.camera.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      if (Platform.isIOS) {
        showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Camera Permission'),
              content: Text(camMsg),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Deny'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoDialogAction(
                  child: const Text('Settings'),
                  onPressed: () => openAppSettings(),
                ),
              ],
            ));
      } else {
        showToastMsg('Camera Permission Required');
        if (await Permission.camera.isPermanentlyDenied) {
          openAppSettings();
        } else {
          await Permission.camera.request();
        }
      }
      return null;
    }
  }

  var picker = ImagePicker();
  String type = '';

  dynamic result;
  if (pickerOption == PickerOption.camera) {
    type = 'C';
    result = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: quality,
        maxWidth: maxWidth,
        maxHeight: maxHeight);
  } else if (pickerOption == PickerOption.gallery) {
    type = 'G';
    if (pickMultiple) {
      result = await picker.pickMultiImage(
          imageQuality: quality, maxWidth: maxWidth, maxHeight: maxHeight);
    } else {
      result = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: quality,
          maxWidth: maxWidth,
          maxHeight: maxHeight);
    }
  } else if (pickerOption == PickerOption.all) {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 150,
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
                  'Choose to pick',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    type = 'C';
                    Navigator.pop(context);
                    result = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: quality,
                        maxWidth: maxWidth,
                        maxHeight: maxHeight);
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () async {
                    type = 'G';
                    Navigator.pop(context);
                    if (pickMultiple) {
                      result = await picker.pickMultiImage();
                    } else {
                      result = await picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: quality,
                          maxWidth: maxWidth,
                          maxHeight: maxHeight);
                    }
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                ),
              ],
            ),
          );
        });
  }

  if (result == null) return;

  if (canDrawDateTime) {
    if (result is List) {
      for (var element in result) {
        await drawTimestamp(element.path, optional: type);
      }
    } else if (result is XFile) {
      await drawTimestamp(result.path, optional: type);
    }
  }

  if (result is List) {
    switch (returnType) {
      case ImageReturnType.uInt8List:
        return result.map((e) async => await e.readAsBytes()).toList();

      case ImageReturnType.base64:
        return result
            .map((e) async => base64Encode(await result.readAsBytes()))
            .toList();

      default:
        return result.map((e) async => await e.path).toList();
    }
  } else if (result is XFile) {
    switch (returnType) {
      case ImageReturnType.uInt8List:
        return await result.readAsBytes();

      case ImageReturnType.base64:
        return base64Encode(await result.readAsBytes());

      default:
        return result.path;
    }
  }
}

drawTimestamp(
    path, {
      String optional = '',
    }) async {
  try {
    var decodeImg = img.decodeImage(File(path).readAsBytesSync());

    img.drawString(decodeImg!, img.arial_14, 5, 5,
        DateFormat('$optional dd/MM/yyyy HH:mm').format(DateTime.now()));

    var finalImage = img.encodeJpg(decodeImg, quality: 100);
    var file = File(path)..writeAsBytesSync(finalImage);
    return file.path;
  } catch (e) {
    return path;
  }
}
