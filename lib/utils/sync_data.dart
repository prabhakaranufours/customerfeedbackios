import 'dart:convert';

import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/models/insertfeedback_request.dart';
import 'package:customerfeedbackios/models/insertuploadimages.dart';
import '../api/customerfeedback_api_call.dart';

typedef onCompleteFunc = Function();
typedef onErrorFunc = Function(String);

List<InsertUploadImages> insertUploadImages = [];
List<InsertfeedbackRequest> insertFeedbackRequest = [];

class SyncData {
  final onCompleteFunc onComplete;
  final onErrorFunc errorFunc;

  SyncData(this.onComplete, this.errorFunc);

  execute() async {
    var feedback = await DatabaseHelper.instance.getAuditData();
    var images = await DatabaseHelper.instance.getImageData();

    insertUploadImages = (images as List)
        .map((e) => InsertUploadImages(
            deviceid: e['deviceId'],
            fileName: e['imageName'],
            guid: e['imageGUID'],
            strBase64: e['image']))
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
      insertFeedbackRequest = (feedback as List)
          .map((e) => InsertfeedbackRequest(
              guid: e['guid'],
              locationId: int.parse(e['locationid']),
              companyId: int.parse(e['companyid']),
              categoryid: e['categoryid'],
              auditId: int.parse(e['auditid']),
              aomname: e[''],
              auditDate: e['auditdate'],
              auditeename: e['auditeename'],
              auditSign: e['auditsign'],
              clientname: e['clientname'],
              clientPerson: e['clientperson'],
              clientSign: e['clientsign'],
              deviceID: e['deviceid'],
              id: e['id'],
              isfeedback: e['isfeedback'],
              sbuid: int.parse(e['sbuid']),
              sbuName: e['sbuname'],
              sectorId: int.parse(e['sectorid']),
              siteName: e['sitename'],
              sSano: e['ssano'],
              uploadfileGUID: e['uploadguid'],
              uploadfilename: e['uploadfilename'],
              userID: e['userid'],
              xml: e['xmldata']))
          .toList();


      insertFeedbackRequest.forEach((element) async {
        var tt = jsonEncode(element);
        var response = await CustomerFeedbackApiCall().submitFeedback(element);
        if (response != null) {
          if (response['Status']) {
            DatabaseHelper.instance
                .feedbackDelete(response['ReturnData']['Table'][0]['gid']);
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
