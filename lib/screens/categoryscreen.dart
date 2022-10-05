import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../widgets/button.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: Text(
            'Select Category',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: lightGrey)
                .copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryDark,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(
                'assets/images/back arrow-8.png',
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.grey,
                    child:
                    Text('Bangalore',style: TextStyle(color: Colors.black),)),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('COVID Feedback'),
                  );
                },
              ),
            ),
            CustomButton(
              buttonText: 'Next Feedback',
              onPressed: () => {
                Navigator.pushReplacementNamed(context, '/question'),
              },
            ),
          ],
        ),
      ),
    );
  }
}
