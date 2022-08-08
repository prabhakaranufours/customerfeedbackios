import 'package:flutter/material.dart';

import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final passwordController = TextEditingController();


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
                    color:Colors.white,
                    borderRadius:BorderRadius.only(
                      topLeft:Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child:Column(
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
                            SizedBox(height: 10),
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
