import 'dart:ffi';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

import '../database/database_helper.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../models/loginresponse.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';
import '../api/customerfeedback_api_call.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//Get LoginDetails
void api(BuildContext context) async {
  // Utils.showLoader(context);
  // var email = await SharedPreferencesHelper.getPrefString(
  //     SharedPreferencesHelper.USER_EMAIL, '');
  var email = 'chitra.murali@i2isoftwares.com';
  var password = 'Password0';
  Loginresponse? response = await CustomerFeedbackApiCall().checkLogin(email, password);
  if(response != null) {
    Utils.showToastMsg(response.message);
    if (response.status) {
      // _showConfirmationDialog(context, "\nLogin Successfully");
      DatabaseHelper.instance.userinsert(response.returnData.userDetails);
      await SharedPreferencesHelper.setPrefString(SharedPreferencesHelper.USER_ID,
          response.returnData.userDetails![0].userID.toString());
      await SharedPreferencesHelper.setPrefString(SharedPreferencesHelper.USER_NAME,
          response.returnData.userDetails![0].userFirstName.toString());

      Navigator.pushReplacementNamed(context, '/download');
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
            child: Text('Ok'),
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
    final Directory? _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir?.path}/../$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
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
  } else if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.sdkInt;
    print('Android $release');

    if (release >= 30) {
      createFolderInAppDocDir(folderName);
    } else {
      if (await Permission.storage.request().isGranted) {
        path = Directory("storage/emulated/0/$folderName");
        if ((await path.exists())) {
          print("exist");
        } else {
          print("not exist");
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastContext().init(context);
    createFol("CustomerFeedback_IOS");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/loginbg.png',
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  transform: Matrix4.translationValues(0, -10, 0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
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
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
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
                        'CustomerFeedback',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .apply(color: Colors.black)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            CustomTextField(
                              placeholder: "User name/Email ID",
                              //validator: (text) => ValidationUtils.validateEmail(text),
                              controller: emailController,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/images/username-8.png',
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomTextField(
                              placeholder: "Password",
                              controller: passwordController,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/images/password-8.png',
                                  height: 15,
                                  width: 15,
                                ),
                              ),
                              obscureText: true,
                              onSubmitted: (_) =>
                                  FocusScope.of(context).unfocus(),
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(height: 25),
                            CustomButton(
                              buttonText: 'LOGIN',
                              onPressed: () => {
                                api(context),

                              },
                            ),
                            SizedBox(height: 10),
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
                                              .bodyText1!
                                              .copyWith(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
