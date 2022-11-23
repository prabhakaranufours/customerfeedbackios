import 'package:customerfeedbackios/database/database_helper.dart';

import '../api/customerfeedback_api_call.dart';

typedef onCompleteFunc = Function();
typedef onErrorFunc = Function(String);

// class SyncData {
//   final Map<String, dynamic> extraParams;
//   final onCompleteFunc onComplete;
//   final onErrorFunc errorFunc;
//
//   // SyncData(this.checklistDao, this.logsheetDao, this.extraParams,
//   //     this.onComplete, this.errorFunc);
//
//   SyncData(this.extraParams,
//       this.onComplete, this.errorFunc);
//
//   execute() async {
//     // var feedback = await checklistDao.getAllChecklistTransaction();
//     var feedback = await DatabaseHelper.instance.getAuditData();
//     var images = await DatabaseHelper.instance.getImageData();
//
//     //Images
//     if (images.isNotEmpty) {
//       images.forEach((element) async {
//         var params = element.toJson();
//         params.addAll(extraParams);
//
//         var response = await CustomerFeedbackApiCall().uploadImages(params);
//
//         if (response != null) {
//           if (response.status!) {
//             // var guid=response['result']['deviceguid'];
//             // checklistDao.updateChecklistTransaction(element.guid);
//             errorFunc('Upload Failed');
//           } else {
//             errorFunc('Upload Failed');
//           }
//         } else {
//           errorFunc('Something wrong');
//         }
//       });
//     }
//
//     checklistDao.updateIsSyncing();
//
//     //Feedback
//     if (feedback.isNotEmpty) {
//       feedback.forEach((element) async {
//         var params = element.toJson();
//         params.addAll(extraParams);
//
//         var response = await CustomerFeedbackApiCall().submitFeedback(params);
//         if (response != null) {
//           if (response.status!) {
//             // var guid=response['result']['deviceguid'];
//             // logsheetDao.updateLogsheetTransaction(element.guid);
//             errorFunc(response.message!);
//           } else {
//             errorFunc(response.message!);
//           }
//         } else {
//           errorFunc('Something wrong');
//         }
//       });
//     }
//
//     logsheetDao.updateIsSyncing();
//
//     onComplete();
//   }
// }
