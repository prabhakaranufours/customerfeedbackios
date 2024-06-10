import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api/customerfeedback_api_call.dart';
// import 'package:toast/toast.dart';

import '../database/database_helper.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../models/loginresponse.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//Get LoginDetails
void api(BuildContext context, String emailId, String pwd) async {
  // Utils.showLoader(context);

  //Take the user to login
  var email = emailId;
  var password = pwd;

  Loginresponse? response =
      await CustomerFeedbackApiCall().checkLogin(email, password);
  if (response != null) {
    showToastMsg(response.message);
    if (response.status) {
      // _showConfirmationDialog(context, "\nLogin Successfully");
      DatabaseHelper.instance.userinsert(response.returnData.userDetails);
      await SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.USER_EMAIL,
          response.returnData.userDetails![0].emailID.toString());
      await SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.USER_PASSWORD, password);
      await SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.USER_ID,
          response.returnData.userDetails![0].userID.toString());
      await SharedPreferencesHelper.setPrefBool(
          SharedPreferencesHelper.IS_LOGIN, true);
      await SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.USER_NAME,
          response.returnData.userDetails![0].userFirstName.toString());
      await SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.IS_FEEDBACK, response.isfeedback.toString());
      await SharedPreferencesHelper.setPrefString(
          SharedPreferencesHelper.COMPANY_LOGO, response.returnData.userDetails![0].compLogo);

      Navigator.popAndPushNamed(context, '/download');
    }
  }
}

//Dialog
Future<void> _showConfirmationDialog(BuildContext context, String msg) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(msg),
        actions: <Widget>[
          CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pop('reloadData');
            },
            child: const Text('Ok'),
            padding: EdgeInsets.zero,
          ),
        ],
      );
    },
  );
}

//Create Folder in Internal app
Future<void> createFolderInAppDocDir(String folderName) async {
  //Get this App Document Directory
  if (await Permission.storage.request().isGranted) {
    // final Directory _appDocDir = await getApplicationDocumentsDirectory();
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/../$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
    } else {
      //if folder not exists create folder and then return its path
      await _appDocDirFolder.create(recursive: true);
    }
  }
}

Future<void> createFol(String folderName) async {
  var path;

  // // You can request multiple permissions at once.
  // Map<Permission, PermissionStatus> statuses = await [
  //   Permission.location,
  //   Permission.storage,
  // ].request();
  // print(statuses[Permission.location]);

  if (Platform.isIOS) {
    // createFolderInAppDocDir(folderName);
  } else if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.sdkInt;
    // print('Android $release');

    if (release >= 30) {
      createFolderInAppDocDir(folderName);
    } else {
      if (await Permission.storage.request().isGranted) {
        path = Directory("storage/emulated/0/$folderName");
        if ((await path.exists())) {
          debugPrint("exist");
        } else {
          debugPrint("not exist");
          path.create();
        }
      }
    }
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRememberMeSelected = true;
  bool isLoading = false;
  String appVersion="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ToastContext().init(context);
    FirebaseMessaging.instance
        .getToken()
        .then((value) => debugPrint('Token $value'));
    get();
  }

  get() async {
    var email = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_EMAIL, '');
    var pwd = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_PASSWORD, '');

    appVersion = 'Version ${await getAppVersion()}';
    emailController.text = email;
    passwordController.text = pwd;
    createFol("CustomerFeedback_IOS");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset(
                'assets/images/loginbg.png',
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                transform: Matrix4.translationValues(0, -10, 0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -15, 0),
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/feedback.png',
                        height: 65,
                        width: 65,
                      ),
                    ),
                    Text(
                      'Customer Feedback',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: Colors.black)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          CustomTextField(
                            placeholder: "Email ID",
                            //validator: (text) => ValidationUtils.validateEmail(text),
                            controller: emailController,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/username-8.png',
                                height: 12,
                                width: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            placeholder: "Password",
                            controller: passwordController,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/password-8.png',
                                height: 12,
                                width: 12,
                              ),
                            ),
                            obscureText: true,
                            onSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 25),
                          CustomButton(
                            buttonText: 'LOGIN',
                            onPressed: isLoading
                                ? null
                                : () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (emailController.text != "" &&
                                        passwordController.text != "") {
                                      if (await isNetConnected()) {
                                        api(context, emailController.text,
                                            passwordController.text);
                                      } else {
                                        Utils.showMessage(
                                            context, "Please check Internet");
                                      }
                                    } else {
                                      //Show the alert dialog for enter details
                                      Utils.showMessage(
                                          context, "Please Enter the fields");
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: isRememberMeSelected,
                                      activeColor: primary,
                                      onChanged: (val) {
                                        setState(() {
                                          isRememberMeSelected = val!;
                                        });
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isRememberMeSelected =
                                              !isRememberMeSelected;
                                        });
                                      },
                                      child: Text(
                                        'Remember me',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 13),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            '${appVersion}\nwww.i2isoftwares.com\n2022. All rights reserved',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
