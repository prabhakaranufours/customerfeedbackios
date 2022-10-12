import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/utils.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({Key? key}) : super(key: key);

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final cNameController = TextEditingController();
  final auditorNameController = TextEditingController();
  final feedbackTakenByController = TextEditingController();
  final feedbackRepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: Text(
            'Submit',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: lightGrey)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryDark,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset('assets/images/back arrow-8.png'),
            ),
          ),
        ),
        body: Column(
          children: [
            Utils.subHeader(context, 'Chitra', ''),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "CUSTOMER NAME",
                          controller: cNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "AUDITOR NAME",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "AUDITEE NAME",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "SITE NAME",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "CLIENT PERSON NAME",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "SBU NAME",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "OM / AOM / SUPERVISOR",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "FEEDBACK TAKENBY",
                          controller: feedbackTakenByController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "FEEDBACK REP NAME",
                          controller: feedbackRepController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "FEEDBACK REP SIGN",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: CustomTextField(
                          placeholder: "CLIENT SIGN",
                          controller: auditorNameController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/images/username-8.png',
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CustomButton(
                          buttonText: 'Submit',
                          onPressed: () => {
                            Navigator.pop(context),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
