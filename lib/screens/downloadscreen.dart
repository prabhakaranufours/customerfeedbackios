import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/models/auditdetails.dart';
import 'package:customerfeedbackios/models/categorydetails.dart';
import 'package:customerfeedbackios/models/companydetails.dart';
import 'package:customerfeedbackios/models/locationdetails.dart';
import 'package:customerfeedbackios/models/questiondetails.dart';
import 'package:customerfeedbackios/models/sbudetails.dart';
import 'package:customerfeedbackios/models/scoredetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../api/customerfeedback_api_call.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final GlobalKey<NavigatorState> key = new GlobalKey<NavigatorState>();
  var percentage= 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Delete all data in db
    deleteDataInDb();

    //Using this way to get the context and passed
    SchedulerBinding.instance.addPostFrameCallback((_) {
     var percentage =  sbuApi(key.currentContext!);
     setState(() {

     });
    });
  }

  //Download the SBU Details
  void sbuApi(BuildContext context) async {

    var userId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_ID, '');
    Sbudetails? response = await CustomerFeedbackApiCall().getSbu(userId);
    if (response != null) {
      showToastMsg(response.message);
      if (response.status) {
        // _showConfirmationDialog(context, "\nLogin Successfully");
        DatabaseHelper.instance.sbuInsert(response.returnData.table);
        companyApi(context);
        percentage = 20;
        setState(() {
        });
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
      showToastMsg(response.message);
      if (response.status) {
        DatabaseHelper.instance.companyInsert(response.returnData.table);
        locationApi(context);
        percentage = 40;
        setState(() {
        });
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
      showToastMsg(response.message);
      if (response.status!) {
        DatabaseHelper.instance.locationInsert(response.returnData?.table);
        auditApi(context);
        percentage = 50;
        setState(() {
        });
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
      showToastMsg(response.message);
      if (response.status!) {
        DatabaseHelper.instance.auditInsert(response.returnData?.table);
        categoryApi(context);
        percentage = 60;
        setState(() {
        });
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
      showToastMsg(response.message);
      if (response.status!) {
        DatabaseHelper.instance.categoryInsert(response.returnData?.table);
        questionApi(context);
        percentage = 70;
        setState(() {
        });
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
      showToastMsg(response.message);
      if (response.status!) {
        DatabaseHelper.instance.questionInsert(response.returnData?.table);
        scoreApi(context);
        percentage = 80;
        setState(() {
        });
      }
    }
  }

//Download the answer Details
  void scoreApi(BuildContext context) async {
    var userId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_ID, '');
    Scoredetails? response =
    await CustomerFeedbackApiCall().getScoreDetails(userId);
    if (response != null) {
      showToastMsg(response.message);
      if (response.status!) {
        DatabaseHelper.instance.answerInsert(response.returnData?.table);
        percentage = 100;
        setState(() {
        });
        Navigator.popAndPushNamed(context, '/home');
      }
    }
  }

//Delete data in db table
  void deleteDataInDb() async {
    DatabaseHelper.instance.sbuDelete();
    DatabaseHelper.instance.companyDelete();
    DatabaseHelper.instance.locationDelete();
    DatabaseHelper.instance.auditDelete();
    DatabaseHelper.instance.categoryDelete();
    DatabaseHelper.instance.questionDelete();
    DatabaseHelper.instance.scoreDelete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:  CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 8.0,
            percent: percentage/100,
            center: new Text(percentage.toString(),
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            progressColor: primaryDark,
          ),
        ),
        key: key);
  }
}
