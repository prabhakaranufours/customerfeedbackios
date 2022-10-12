import 'package:customerfeedbackios/models/loginresponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toast/toast.dart';

class Utils {
  // static ResponseLogin responseLogin;
  // static UserDetail userDetail = UserDetail();
  // static Loginresponse loginresponse = Loginresponse();
  // static SettingDetail settingDetail;

  //static Position userLocation;

  static void showToastMsg(String? msg) {
    //
    // Toast.show(
    //   msg,
    //   context,
    //   duration: 2,
    // );

    Toast.show(msg!);
  }

  static int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static void showLoader(BuildContext context) {
//    Loader.show(
//      context,
//      progressIndicator: ClipRRect(
//        borderRadius: BorderRadius.circular(5),
//        child: Image.asset(
//          'assets/images/loader.gif',
//          height: 100,
//          width: 100,
//          fit: BoxFit.fill,
//        ),
//      ),
//      overlayColor: Colors.black.withOpacity(0.5),
//    );
    EasyLoading.show();
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  static Future<void> showContactAdminDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Please contact Facility Admin to book optDesk',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .apply(color: Colors.black),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //This Subheader will use in all pages [Prabhakaran]
  static Widget subHeader(BuildContext context, String msg, String msg1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(7.0),
              child: Text(
                  msg,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )),
        ),
        Expanded(
          flex: 6,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(7.0),
              child: Text(
                msg1,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              )),
        ),
      ],
    );
  }


}
