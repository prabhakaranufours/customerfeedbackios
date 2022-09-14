import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/models/sbudetails.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map> sbuDetails = [];
  String sbuText = "Select SBU";

  TextEditingController searchController = TextEditingController();
  var sbuTextController = TextEditingController();

  //After click the list item in sbu then set the value in text
  void setSbuData(String value){
    setState(() {
      sbuText = value;
    });
  }

  Future<void> _showSBU(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: CustomTextField(
                            placeholder: "Search",
                            onSubmitted: (_) =>
                                FocusScope.of(context).unfocus(),
                            onChanged: (val) async {
                              if (val == null || val == "") {
                                sbuDetails =
                                    await DatabaseHelper.instance.getSBU();
                              } else {
                                sbuDetails.forEach((element) {
                                  element['locationsettingsname'];
                                });
                              }
                              setState(() {});
                            },
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/search-8.png',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            controller: searchController,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: sbuDetails.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                setSbuData(sbuDetails[index]["locationsettingsname"]);
                                Navigator.of(context).pop();
                                // _getLocation();
                              },
                              title: Text(
                                '${sbuDetails[index]["locationsettingsname"]}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    sbuDetails = await DatabaseHelper.instance.getSBU();

    sbuDetails.forEach((element) {
      print(element['list']);
    });
  }

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
                // List<UserDetails> userd = [];
                // var s = UserDetails();
                // s.emailID = "prabhakaran.s@ufours.com";
                // s.isWorkstationLogin = 1;
                // userd.add(s);
                // DatabaseHelper.instance.userinsert(userd);
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
                          '$sbuText',
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
                    onPressed: () {
                      _showSBU(context);
                    },
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
