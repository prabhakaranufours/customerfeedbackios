import 'package:customerfeedbackios/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:i2iutils/helpers/common_functions.dart';

import '../api/customerfeedback_api_call.dart';
import '../database/database_helper.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../models/otpdetails.dart';
import '../widgets/app_bar.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  String apiGetOTP = "";
  String typedCode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOTP();
  }


  //This method is used for get the otp from the apiu
  void getOTP() async {
    var companyId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.COMPANY_ID, '');
    var locationId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_ID, '');
    var userId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_ID, '');

    Otpdetails? response = await CustomerFeedbackApiCall()
        .getOTPDetails(companyId, locationId, userId);
    if (response != null) {
      // Utils.showToastMsg(response.message);
      if (response.status == 1) {
        apiGetOTP = response.otp!;

        print('OTP CHECK' + response.otp!);
      }
    }
  }

  verifyOtp(){
    if (apiGetOTP == typedCode) {
      Navigator.popAndPushNamed(context, '/submit');
    } else {
      showToastMsg('OTP Wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
    context,
    title: const Text(
      'OTP Verify',
      style: TextStyle(fontWeight: FontWeight.bold)
    ),
    backgroundColor: primaryDark,

      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

          Image.asset('assets/images/otp_enter.png',width: 250,height: 250,),
          const SizedBox(height: 64,),
          OtpTextField(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            numberOfFields: 6,
            borderColor: const Color(0xFF90151A),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when every textfield is filled
            onSubmit: (val) {
              debugPrint('sub $val');
              typedCode=val;
              // verifyOtp();
            }, // end onSubmit
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      buttonText: 'RESEND OTP',
                      textSize: 15,
                      buttonType: ButtonType.third,
                      onPressed: () => getOTP()),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButton(
                      buttonText: 'NEXT',
                      textSize: 15,
                      onPressed: ()=>verifyOtp()),
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
}
