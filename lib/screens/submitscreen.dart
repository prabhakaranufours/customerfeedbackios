import 'dart:convert';
import 'dart:typed_data';

import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:i2iutils/helpers/common_functions.dart';
import 'package:signature/signature.dart';

import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../models/auditdata.dart';
import '../models/categorydata.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import 'package:i2iutils/widgets/boxedittext.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({Key? key}) : super(key: key);

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final cNameController = TextEditingController();
  final auditorNameController = TextEditingController();
  final auditeeNameController = TextEditingController();
  final siteNameController = TextEditingController();
  final clientPersonNameController = TextEditingController();
  final sbuNameController = TextEditingController();
  final aomController = TextEditingController();
  final feedbackRepSignController = TextEditingController();
  final feedbackTakenByController = TextEditingController();
  final feedbackRepController = TextEditingController();

  final signController = SignatureController();
  final repSignController = SignatureController();

  String sectorId = "";
  String sbuId = "";
  String sbuname = "";
  String auditId = "";
  String categoryId = "";
  String companyId = "";
  String locationId = "";
  String locationName = "";
  String userId = "";
  String userName = "";
  String isFeedback = "";

  List<Auditdata> auditDataDetails = [];
  List<Categorydata> categoryDetails = [];

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
    exportPenColor: Colors.black,
    onDrawStart: () => debugPrint('onDrawStart called!'),
    onDrawEnd: () => debugPrint('onDrawEnd called!'),
  );

  Future<void> exportImage(BuildContext context) async {
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No content')));
      return;
    }

    final Uint8List? data = await _controller.toPngBytes();
    if (data == null) {
      return;
    }

    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(data),
              ),
            ),
          );
        },
      ),
    );
  }

  void storeInDb(BuildContext context) async {
    if (auditeeNameController.text != "" &&
        auditorNameController.text != "" &&
        aomController.text != "" &&
        sbuNameController.text != "" &&
        clientPersonNameController.text != "" &&
        siteNameController.text != "" &&
        repSignController.isNotEmpty &&
    signController.isNotEmpty
    ) {

      var deviceId = await getDeviceUniqueId();
      var catData = await DatabaseHelper.instance
          .getCategoryDetailsWithParameters(
              sbuId, companyId, locationId, auditId, sectorId, categoryId);

      auditDataDetails = [
        Auditdata(
            strClientfeedback: "",
            strAdditionalinformatin: "",
            clientsign: base64Encode(
                (await repSignController.toPngBytes())?.toList() ?? []),
            auditsign: base64Encode(
                (await signController.toPngBytes())?.toList() ?? []),
            auditdate: getDate(),
            userid: userId,
            guid: getCustomUniqueId(),
            deviceid: deviceId,
            uploadguid: getCustomUniqueId(),
            uploadfilename: getCustomUniqueId(),
            auditeename: auditeeNameController.text,
            auditorname: auditorNameController.text,
            oamname: aomController.text,
            sbuname: sbuNameController.text,
            clientperson: clientPersonNameController.text,
            ssano: "",
            sitename: siteNameController.text,
            clientname: "",
            xmldata: '\u003croot\u003e${xmlData(catData)}\u003c/root\u003e',
            categoryid: categoryId,
            auditid: auditId,
            sectorid: sectorId,
            locationid: locationId,
            companyid: companyId,
            sbuid: sbuId,
            observation: "",
            isfeedback: isFeedback)
      ];

      // var auditDataJSON = auditData.toJson();
      debugPrint('AUidtDataJSON $auditDataDetails');
      //Take the object to set in db
      await DatabaseHelper.instance.auditDataInsert(auditDataDetails);
      //Delete the data from category details percentage and qnsdetails
      await DatabaseHelper.instance.catDataDelete(sbuId, companyId, locationId,
          auditId, sectorId, categoryId);
      //Update the percentage in category Details
      await DatabaseHelper.instance.cdPercentageUpdate_auditId(
          "0", auditId.toString());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      Utils.showMessage(context, "Please Enter the fields");
    }
  }

  xmlData(List<Map<dynamic, dynamic>> catData) {
    return catData
        .map((e) =>
    "\u003cfacilityaudit  auditid\u003d\"${e['auditid']}\" categoryid\u003d\"${e['categoryid']}\" questionid\u003d\"${e['questionid']}\" scoreid\u003d\"${e['scoreid']}\" uploadfilename\u003d\"${e['uploadfilename'] ?? ''}\" uploadfileGUID\u003d\"${e['uploadfilename'] ?? ""}\" remarks\u003d\"${e['remarks']}\" /\u003e")
            // "<facilityaudit auditid=${e['auditid']} categoryid=${e['categoryid']}  questionid=${e['questionid']} scoreid=${e['scoreid']} uploadfilename= ${e['uploadfilename'] ?? ""} uploadfileGUID=${e['uploadfilename'] ?? ""} remarks=${e['remarks']}>")
        .toList()
        .join(',');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    get();
  }

  //We cannot write setstate in between didchangeDependencies so write seperate
  void get() async {
    sbuId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SBU_ID, '');
    sbuname = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SBU_NAME, '');
    auditId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.FEEDBACK_ID, '');
    categoryId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.CATEGORY_ID, '');
    companyId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.COMPANY_ID, '');
    locationId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_ID, '');
    locationName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_NAME, '');
    userId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_ID, '');
    userName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_NAME, '');
    sectorId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SECTOR_ID, '');
    isFeedback = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.IS_FEEDBACK, '');

    //Set the default values for some fields
    auditorNameController.text = userName;
    clientPersonNameController.text = locationName;
    sbuNameController.text = locationName;
    aomController.text = userName;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //This for back functionality
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: primaryDark,
        ),
        body: Column(
          children: [
            Utils.subHeader(context, 'Chitra', ''),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      BoxEditText(
                        placeholder: 'CUSTOMER NAME',
                        controller: cNameController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'AUDITOR NAME',
                        controller: auditorNameController,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'AUDITEE NAME',
                        controller: auditeeNameController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'SITE NAME',
                        controller: siteNameController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'CLIENT PERSON NAME',
                        controller: clientPersonNameController,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'SBU NAME',
                        controller: sbuNameController,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'OM / AOM / SUPERVISOR',
                        controller: aomController,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'FEEDBACK TAKENBY',
                        controller: feedbackTakenByController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      BoxEditText(
                        placeholder: 'FEEDBACK REP NAME',
                        controller: feedbackRepController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            'assets/images/username-8.png',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "REP Signature",
                          ),
                          InkWell(
                            onTap: () {
                              repSignController.clear();
                            },
                            child: Text(
                              "Clear Sign",
                              style: TextStyle(
                                  color: primaryDark,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryDark),
                            borderRadius: BorderRadius.circular(8)),
                        height: 160,
                        child: Signature(
                          controller: repSignController,
                          height: 150,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Client Signature",
                          ),
                          InkWell(
                            onTap: () {
                              signController.clear();
                            },
                            child: Text(
                              "Clear Sign",
                              style: TextStyle(
                                  color: primaryDark,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryDark),
                            borderRadius: BorderRadius.circular(8)),
                        height: 160,
                        child: Signature(
                          controller: signController,
                          height: 150,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        buttonText: 'Submit',
                        margin: const EdgeInsets.only(bottom: 30),
                        onPressed: () => storeInDb(context),

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
