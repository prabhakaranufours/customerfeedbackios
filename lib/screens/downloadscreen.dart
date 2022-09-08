import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/models/auditdetails.dart';
import 'package:customerfeedbackios/models/categorydetails.dart';
import 'package:customerfeedbackios/models/companydetails.dart';
import 'package:customerfeedbackios/models/locationdetails.dart';
import 'package:customerfeedbackios/models/questiondetails.dart';
import 'package:customerfeedbackios/models/sbudetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../api/customerfeedback_api_call.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

//Download the SBU Details
void sbuApi(BuildContext context) async {
  var userId = await SharedPreferencesHelper.getPrefString(
      SharedPreferencesHelper.USER_ID, '');
  Sbudetails? response = await CustomerFeedbackApiCall().getSbu(userId);
  if (response != null) {
    Utils.showToastMsg(response.message);
    if (response.status) {
      // _showConfirmationDialog(context, "\nLogin Successfully");
      DatabaseHelper.instance.sbuInsert(response.returnData.table);
      companyApi(context);
    }
  }
}

//Download the Company Details
void companyApi(BuildContext context) async {
  var userId = await SharedPreferencesHelper.getPrefString(
      SharedPreferencesHelper.USER_ID, '');
  Companydetails? response =
      await CustomerFeedbackApiCall().getCompanyDetails(userId);
  if (response != null) {
    Utils.showToastMsg(response.message);
    if (response.status) {
      DatabaseHelper.instance.companyInsert(response.returnData.table);
      locationApi(context);
    }
  }
}

//Download the Location Details
void locationApi(BuildContext context) async {
  var userId = await SharedPreferencesHelper.getPrefString(
      SharedPreferencesHelper.USER_ID, '');
  Locationdetails? response =
      await CustomerFeedbackApiCall().getLocationDetails(userId);
  if (response != null) {
    Utils.showToastMsg(response.message);
    if (response.status!) {
      DatabaseHelper.instance.locationInsert(response.returnData?.table);
      auditApi(context);
    }
  }
}

//Download the audit Details
void auditApi(BuildContext context) async {
  var userId = await SharedPreferencesHelper.getPrefString(
      SharedPreferencesHelper.USER_ID, '');
  Auditdetails? response =
      await CustomerFeedbackApiCall().getAuditDetails(userId);
  if (response != null) {
    Utils.showToastMsg(response.message);
    if (response.status!) {
      DatabaseHelper.instance.auditInsert(response.returnData?.table);
      categoryApi(context);
    }
  }
}

//Download the category Details
void categoryApi(BuildContext context) async {

  var userId = await SharedPreferencesHelper.getPrefString(
      SharedPreferencesHelper.USER_ID, '');
  Categorydetails? response =
  await CustomerFeedbackApiCall().getCategoryDetails(userId);
  if (response != null) {
    Utils.showToastMsg(response.message);
    if (response.status!) {
      DatabaseHelper.instance.categoryInsert(response.returnData?.table);
      questionApi(context);
    }
  }
}

//Download the question Details

void questionApi(BuildContext context) async {

  var userId = await SharedPreferencesHelper.getPrefString(
      SharedPreferencesHelper.USER_ID, '');
  Questiondetails? response =
  await CustomerFeedbackApiCall().getQuestionDetails(userId);
  if (response != null) {
    Utils.showToastMsg(response.message);
    if (response.status!) {
      DatabaseHelper.instance.questionInsert(response.returnData?.table);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}


class _DownloadScreenState extends State<DownloadScreen> {
  final GlobalKey<NavigatorState> key = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      sbuApi(key.currentContext!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: key);
  }
}
