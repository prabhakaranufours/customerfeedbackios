import 'dart:convert';

import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../database/database_helper.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../widgets/button.dart';

class CategoryScreen extends StatefulWidget {
  String companyId = "";
  String auditId = "";

  //This line used to get the data from previous screen
  final Map<String, String> data;

  CategoryScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Map> categoryDetails = [];
  var percentage;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.data['companyId']);
    print(widget.data['feedbackId']);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    get();
  }

  //We cannot write setstate in between didchangeDependencies so write seperate
  void get() async {
    // var categoryId = await SharedPreferencesHelper.getPrefString(
    //     SharedPreferencesHelper.CATEGORY_ID, '');
    // var auditId = await SharedPreferencesHelper.getPrefString(
    //     SharedPreferencesHelper.AUDIT_ID, '');
    // var sbuId = await SharedPreferencesHelper.getPrefString(
    //     SharedPreferencesHelper.SBU_ID, '');
    // var companyId = await SharedPreferencesHelper.getPrefString(
    //     SharedPreferencesHelper.COMPANY_ID, '');
    // var locationId = await SharedPreferencesHelper.getPrefString(
    //     SharedPreferencesHelper.LOCATION_ID, '');
    // var sectorId = await SharedPreferencesHelper.getPrefString(
    //     SharedPreferencesHelper.SECTOR_ID, '');

    //Get the percentage of category from categoryData table
    // percentage = await DatabaseHelper.instance.getCategoryDetailsPercentage(
    //     sbuId, companyId, locationId, auditId, sectorId, categoryId);


    categoryDetails = await DatabaseHelper.instance
        .getCategory(widget.data['companyId']!, widget.data['feedbackId']!);

    debugPrint(jsonEncode(categoryDetails));

    await SharedPreferencesHelper.setPrefString(
        SharedPreferencesHelper.AUDIT_ID, widget.data['feedbackId']!);
    setState(() {});
  }

  void nextPage(String categoryId) async {
    await SharedPreferencesHelper.setPrefString(
        SharedPreferencesHelper.CATEGORY_ID, categoryId);
    //After close the qns page it returns the result true
    var result = await Navigator.pushNamed(context, '/question');
    debugPrint('result is a $result');
    if(result != null && result == true){
      get();
    }
  }

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
            onTap: () {
              // Navigator.pop(context,true);
              Navigator.pop(context);
            },
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
            Utils.subHeader(context, 'Bangalore', ''),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryDetails.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      nextPage(categoryDetails[index]["categoryid"]);
                    },
                    child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 300,
                                child: Text(
                                  '${categoryDetails[index]["categoryname"]}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                height: 50,
                                child: CircularPercentIndicator(
                                  radius: 25.0,
                                  lineWidth: 5.0,
                                  percent:  int.parse(categoryDetails[index]["percentage"] ?? "0") / 100,
                                  center: new Text(
                                    categoryDetails[index]["percentage"] ?? "0",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  progressColor: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: CustomButton(
                buttonText: 'Next Feedback',
                borderColor: primaryDark,
                onPressed: () => {
                  Navigator.pushNamed(context, '/score'),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
