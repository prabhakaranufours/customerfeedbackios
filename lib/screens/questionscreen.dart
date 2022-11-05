import 'dart:convert';
import 'dart:ffi';
import 'package:customerfeedbackios/models/categorydata.dart';
import 'package:customerfeedbackios/widgets/MyRadioOptions.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // final remarksController = TextEditingController();
  String? _groupValue;

  // ValueChanged<String?> _valueChangedHandler() {
  //   return (value) => setState(() => _groupValue = value!);
  // }

  Map<String, dynamic> emojigrey = {
    '1': "assets/images/one_grey.png",
    '2': "assets/images/two_grey.png",
    '3': "assets/images/three_grey.png",
    '4': "assets/images/four_grey.png",
    '5': "assets/images/five_grey.png",
    'n/a': "assets/images/five_grey.png"
  };
  Map<String, dynamic> emojiSelect = {
    '1': "assets/images/one.png",
    '2': "assets/images/two.png",
    '3': "assets/images/three.png",
    '4': "assets/images/four.png",
    '5': "assets/images/five.png",
    'n/a': "assets/images/five.png"
  };
  var temp = ['2', '3', '1', '5', 'n/a', '4'];

  List<Categorydata> qnsDetails = [];
  List<Map> scoreDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  // @override
  // void didChangeDependencies() async {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   // get();
  // }

  void get() async {
    debugPrint('did changes');

    var categoryId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.CATEGORY_ID, '');
    var auditId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.AUDIT_ID, '');
    var sbuId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SBU_ID, '');
    var companyId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.COMPANY_ID, '');
    var locationId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_ID, '');
    var sectorId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SECTOR_ID, '');

    var q = await DatabaseHelper.instance.getQuestion(categoryId);
    scoreDetails = await DatabaseHelper.instance.getAnswer(auditId);

    //Map to List
    qnsDetails = q
        .map((e) => Categorydata(
            questionid: e['auditqid'],
            question: e['auditqname'],
            remarks: e['description'],
            categoryid: e['categoryid'],
            weightage: e['weightageid'],
            auditid: auditId,
            sbuid: sbuId,
            companyid: companyId,
            locationid: locationId,
            sectorid: sectorId))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: Text(
            'Questions',
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
              child: Image.asset(
                'assets/images/back arrow-8.png',
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Utils.subHeader(
                context, 'Bangalore', 'Audit > Category > Question'),
            Expanded(
              child: ListView.builder(
                itemCount: qnsDetails.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            '${qnsDetails[i].question}',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              itemCount: scoreDetails.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return index == 5
                                    ? Container(
                                        height: 30,
                                        width: 70,
                                        margin: EdgeInsets.all(10),
                                        child: CustomButton(
                                            buttonText: 'n/a',
                                            onPressed: () {
                                              setState(() {
                                                qnsDetails[i].scoreid =
                                                    // '$i' + '6';
                                                    '6';
                                              });
                                            }))
                                    : MyRadioOption(
                                        value:
                                            // '$i${scoreDetails[index]['scorename']}',
                                            '${scoreDetails[index]['scorename']}',
                                        groupValue: qnsDetails[i].scoreid,
                                        onChanged: (val) {
                                          qnsDetails[i].scoreid = val;
                                          qnsDetails[i].categorydone = '';
                                          print(jsonEncode(qnsDetails));

                                          setState(() {});
                                        },
                                        label: scoreDetails[index]['scorename'],
                                        text: emojigrey[scoreDetails[index]
                                            ['scorename']],
                                        selectedText: emojiSelect[
                                            scoreDetails[index]['scorename']],
                                      );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextField(
                                  onChanged: (val) {
                                    qnsDetails[i].remarks = val;
                                  },
                                  controller: null,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: ImageIcon(
                                    AssetImage("assets/images/camera.png"),
                                    color: Color(0xFF3A5A98),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: CustomButton(
                buttonText: 'Submit Audit',
                onPressed: () {
                  print(jsonEncode(qnsDetails));
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
