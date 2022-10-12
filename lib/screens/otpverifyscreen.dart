import 'package:customerfeedbackios/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../helpers/colors.dart';
import '../widgets/app_bar.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: customAppBar(
        context,
        title: Text(
          'OTP Verify',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .apply(color: lightGrey)
              .copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryDark,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Image.asset('assets/images/back arrow-8.png'),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      buttonText: 'RESEND OTP',
                      textSize: 15,
                      onPressed: () => {

                  }),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CustomButton(
                      buttonText: 'NEXT',
                      textSize: 15,
                      onPressed: () => {
                      Navigator.pushNamed(context, '/submit'),
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
