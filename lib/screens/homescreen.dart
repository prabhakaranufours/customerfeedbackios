import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: Text(
            'Home',
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
                'assets/images/menubar-8.png',
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {

                DatabaseHelper.instance.insert({
                  DatabaseHelper.userName: 'Prabhakaran',
                  DatabaseHelper.password: 'Password0'
                });
              },
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Image.asset(
                  'assets/images/QRcode-8.png',
                  height: 35,
                  width: 35,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/cloud-computing.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor: Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select SBU',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor: Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Comapany',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor: Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Location',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 7,
                      foregroundColor: Colors.black, // foreground (text) color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Feedback',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                        ),
                        // SizedBox(width: 10),
                        Image.asset(
                          'assets/images/downarrow.png',
                          height: 10,
                          width: 10,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text('Sector',
                      style: TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.left),
                ),
                SizedBox(height: 30),
                CustomButton(
                  buttonText: 'Feedback',
                  onPressed: () => {
                    Navigator.pushReplacementNamed(context, '/home'),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
