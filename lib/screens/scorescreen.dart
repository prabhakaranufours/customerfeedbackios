import 'package:customerfeedbackios/helpers/utils.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
        customAppBar(
          context,
          title: Text(
            'Score',
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
          children: [
            Utils.subHeader(context, 'Bangalore', 'Audit > Category > Score'),
            Container(
              margin: EdgeInsets.all(5),
              child: CustomButton(
                buttonText: 'SUBMIT',
                onPressed: () => {
                Navigator.pushNamed(context, '/otp'),
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
