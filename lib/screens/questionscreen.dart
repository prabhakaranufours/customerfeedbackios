import 'dart:convert';

import 'package:customerfeedbackios/models/categorydata.dart';
import 'package:customerfeedbackios/models/feedbackimages.dart';
import 'package:customerfeedbackios/widgets/MyRadioOptions.dart';
import 'package:flutter/material.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:i2iutils/helpers/image_picker_helper.dart';
import 'package:i2iutils/widgets/boxedittext.dart';

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
  final remarksController = TextEditingController();

  bool isUpdate = false;

  Map<String, dynamic> emojigrey = {
    '1': "assets/images/one_grey.png",
    '2': "assets/images/two_grey.png",
    '3': "assets/images/three_grey.png",
    '4': "assets/images/four_grey.png",
    '5': "assets/images/five_grey.png",
    'n/a': "assets/images/na_unselect.png"
  };
  Map<String, dynamic> emojiSelect = {
    '1': "assets/images/one.png",
    '2': "assets/images/two.png",
    '3': "assets/images/three.png",
    '4': "assets/images/four.png",
    '5': "assets/images/five.png",
    'n/a': "assets/images/na.png"
  };

  List<Categorydata> qnsDetails = [];
  List<FeedbackImages> feedbackImageList = [];
  List<Map> scoreDetails = [];
  String categoryId = "";
  String auditId = "";
  String companyId = "";
  String locationId = "";
  String sbuId = "";
  String feedbackName = "";
  String locName = "";
  String categoryName = "";
  var q;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  //Insert in the categoryData table
  Future storeInDb(List<Categorydata> qnsDetails) async {
    var percentage = 0;
    int s =
        qnsDetails.where((element) => element.scoreid != null).toList().length;
    var categoryId = qnsDetails[0].categoryid;
    percentage = ((s / qnsDetails.length) * 100).toInt();

    //This line for include percentage in CategoryData Table
    qnsDetails.forEach((element) {
      element.percentage = percentage.toString();
    });

    //Update the percentage in category Details
    await DatabaseHelper.instance.categoryDetailsPercentageUpdate(
        percentage.toString(), categoryId.toString());

    var deviceId = await getDeviceUniqueId();

    //Insert images in feedback image table
    feedbackImageList = qnsDetails
        .where((element) => element.image?.isNotEmpty ?? false)
        .map((e) => FeedbackImages(
            auditId: auditId,
            categoryid: categoryId,
            companyId: companyId,
            deviceId: deviceId,
            image: e.image,
            imageGUID: getCustomUniqueId(),
            imageName: '${getCustomUniqueId()}.png',
            locationId: locationId,
            sbuId: sbuId))
        .toList();

    debugPrint(feedbackImageList.toString());
    await DatabaseHelper.instance.feedbackImagesInsert(feedbackImageList);

    if (isUpdate) {
      await DatabaseHelper.instance.categoryDataUpdate(qnsDetails);
    } else {
      await DatabaseHelper.instance.categoryDataInsert(qnsDetails);
    }
  }

  void get() async {
    // debugPrint('did changes');

    categoryId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.CATEGORY_ID, '');
    auditId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.AUDIT_ID, '');
    sbuId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SBU_ID, '');
    companyId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.COMPANY_ID, '');
    locationId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_ID, '');
    var sectorId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SECTOR_ID, '');
    feedbackName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.FEEDBACK_NAME, '');
    locName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_NAME, '');
    categoryName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.CATEGORY_NAME, '');

    q = await DatabaseHelper.instance.getCategoryDetailsWithParameters(
        sbuId, companyId, locationId, auditId, sectorId, categoryId);
    scoreDetails = await DatabaseHelper.instance.getAnswer(auditId);

    if ((q as List).isNotEmpty) {
      // Update
      //Map to List
      isUpdate = true;
      qnsDetails = (q as List)
          .map((e) => Categorydata(
              percentage: e['Percentage'],
              sbuid: e['sbuid'],
              companyid: e['companyid'],
              locationid: e['locationid'],
              auditid: e['auditid'],
              sectorid: e['sectorid'],
              categoryid: e['categoryid'],
              questionid: e['questionid'],
              question: e['question'],
              scoreid: e['scoreid'],
              remarks: e['remarks'],
              image: e['image'],
              id: e['id'],
              imagename: e['imagename'],
              uploadfilename: e['uploadfilename'],
              weightage: e['weightage'],
              categorydone: e['categorydone']))
          .toList();
    } else {
      // New
      isUpdate = false;
      q = await DatabaseHelper.instance.getQuestion(categoryId);

      //Map to List
      qnsDetails = (q as List)
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
              sectorid: sectorId,
              categorydone: "false"))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: const Text('Questions',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: primaryDark,
      ),
      body: Column(
        children: [
          // Utils.subHeader(context, 'Bangalore', 'Audit > Category > Question'),
          Utils.subHeader(context, locName, '$feedbackName > $categoryName'),
          Expanded(
            child: ListView.builder(
              itemCount: qnsDetails.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Card(
                    elevation: 3,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${qnsDetails[i].question}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                scoreDetails.length,
                                (index) => MyRadioOption(
                                      value:
                                          // '$i${scoreDetails[index]['scorename']}',
                                          '${scoreDetails[index]['scorename']}',
                                      groupValue: qnsDetails[i].scoreid,
                                      onChanged: (val) {
                                        qnsDetails[i].scoreid = val;
                                        qnsDetails[i].categorydone =
                                            index != 5 ? "true" : "false";
                                        debugPrint(jsonEncode(qnsDetails));

                                        setState(() {});
                                      },
                                      label: scoreDetails[index]['scorename'],
                                      text: emojigrey[scoreDetails[index]
                                              ['scorename']
                                          .toString()
                                          .toLowerCase()],
                                      selectedText: emojiSelect[
                                          scoreDetails[index]['scorename']
                                              .toString()
                                              .toLowerCase()],
                                    )),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: BoxEditText(
                                  placeholder: 'Remarks',
                                  onChanged: (val) {
                                    qnsDetails[i].remarks = val;
                                  },
                                  controller: TextEditingController(
                                      text: qnsDetails[i].remarks),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              InkWell(
                                onTap: () async {
                                  var image = await getImage(context,
                                      canDrawDateTime: true,
                                      returnType: ImageReturnType.base64);
                                  if (image != null)
                                    qnsDetails[i].image = image;
                                  setState(() {});
                                },
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: qnsDetails[i].image == null
                                      ? const ImageIcon(
                                          AssetImage(
                                              "assets/images/camera.png"),
                                          color: Color(0xFF3A5A98),
                                        )
                                      : Image.memory(
                                          base64Decode(qnsDetails[i].image!)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      ),
                    ));
              },
            ),
          ),
          CustomButton(
            buttonText: 'Submit Audit',
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
            onPressed: () async {
              print(jsonEncode(qnsDetails));

              await storeInDb(qnsDetails);
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }
}
