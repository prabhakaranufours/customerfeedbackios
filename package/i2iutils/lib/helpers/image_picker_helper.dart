import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

Future<dynamic> getImage(
    {PickerOption pickerOption = PickerOption.camera,
    ImageReturnType returnType = ImageReturnType.filePath,
    bool pickMultiple = false,
    double maxWidth = 200,
    double maxHeight = 200,
    int quality = 50,
    BuildContext? context}) async {

  if(pickerOption==PickerOption.all && context==null){
    throw ArgumentError.value(
        context, 'build context', 'Context is must for showing option dialog');
  }

  var picker = ImagePicker();

  dynamic result;
  if (pickerOption == PickerOption.camera) {
    result = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: quality,
        maxWidth: maxWidth,
        maxHeight: maxHeight);
  } else if (pickerOption == PickerOption.gallery) {
    if (pickMultiple) {
      result = await picker.pickMultiImage(
          imageQuality: quality,
          maxWidth: maxWidth,
          maxHeight: maxHeight);
    } else {
      result = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: quality,
          maxWidth: maxWidth,
          maxHeight: maxHeight);
    }
  } else if (pickerOption == PickerOption.all) {
    if (context == null) {
      debugPrint('PickerOption.all need non null context');
      return null;
    }
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

  if (result != null && result is List) {
    if (returnType == ImageReturnType.uInt8List) {
      return result.map((e) async => await e.readAsBytes()).toList();
    } else if (returnType == ImageReturnType.base64) {
      return result.map((e) async => base64Encode(await result.readAsBytes())).toList();
    }else {
      return result.map((e) async => await e.path).toList();
    }
  } else if (result != null && result is XFile) {
    if (returnType == ImageReturnType.uInt8List) {
      return await result.readAsBytes();
    }else if (returnType == ImageReturnType.base64) {
      return base64Encode(await result.readAsBytes());
    } else {
      return result.path;
    }
  }

  return null;
}
