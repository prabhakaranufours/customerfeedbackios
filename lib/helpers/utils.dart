import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:customerfeedbackios/helpers/shared_preferences_helper.dart';
import 'package:customerfeedbackios/models/loginresponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:toast/toast.dart';

import '../screens/loginscreen.dart';

class Utils {


  static int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static void showLoader(BuildContext context) {
    EasyLoading.show();
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  //This dialog used for exit show dialog in home page [Prabhakaran]
  static Future<void> showExitDialog(BuildContext context,String msg,Function() onPressed) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  '$msg',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .apply(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: ()=> onPressed(),

            ),
            TextButton(
              child: Text('No'),
              onPressed: ()=> Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }



  //This Subheader will use in all pages [Prabhakaran]
  static Widget subHeader(BuildContext context, String msg, String msg1) {
    return Container(
      color: Colors.grey.shade300,
        padding: const EdgeInsets.all(8),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              msg,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Text(
              msg1,
              style: const TextStyle(color: Colors.black, fontSize: 13,),
              maxLines: 2,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }


  //This is used for showing the error message [Prabhakaran]
  static showMessage(BuildContext context, String msg) {
    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: msg,
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




}
