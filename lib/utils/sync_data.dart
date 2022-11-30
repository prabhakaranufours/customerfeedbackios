import 'dart:convert';

import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/models/auditdata.dart';
import 'package:customerfeedbackios/models/insertuploadimages.dart';
import '../api/customerfeedback_api_call.dart';

typedef onCompleteFunc = Function();
typedef onErrorFunc = Function(String);

List<InsertUploadImages> insertUploadImages = [];


class SyncData {
  final onCompleteFunc onComplete;
  final onErrorFunc errorFunc;

  SyncData(this.onComplete, this.errorFunc);

  execute() async {
    var feedback = await DatabaseHelper.instance.getAuditData();
    var images = await DatabaseHelper.instance.getImageData();

    insertUploadImages = (images as List)
        .map((e) => InsertUploadImages(
            deviceid: e['deviceId'], fileName: e['imageName'], guid: e['imageGUID'], strBase64: e['image']))
        .toList();

    //Images
    if (insertUploadImages.isNotEmpty) {
      insertUploadImages.forEach((element) async {
        // var params = jsonEncode(element);
        var response = await CustomerFeedbackApiCall().uploadImages(element);

        if (response != null) {
          if (response.status!) {
            //Delete the image in feedback Images using guid
            DatabaseHelper.instance.imageDelete(response.guid);
            errorFunc('Upload Failed');
          } else {
            errorFunc('Upload Failed');
          }
        } else {
          errorFunc('Something wrong');
        }
      });
    }



    //Feedback
    if (feedback.isNotEmpty) {

      List<Auditdata> auditDataList = feedback.map((e) => Auditdata.fromJson(e)).toList();


      auditDataList.forEach((element) async {
        var params = element.toJson();
        var test = jsonEncode(element);
        // params.addAll(extraParams);

        var response = await CustomerFeedbackApiCall().submitFeedback(element);
        if (response != null) {
          if (response['Status']) {
            // var guid=response['result']['deviceguid'];
            // logsheetDao.updateLogsheetTransaction(element.guid);

            DatabaseHelper.instance.feedbackDelete(response['ReturnData']['Table'][0]['gid']);
            errorFunc(response['Message']);
          } else {
            errorFunc(response['Message']);
          }
        } else {
          errorFunc('Something wrong');
        }
      });
    }

    onComplete();
  }
}
