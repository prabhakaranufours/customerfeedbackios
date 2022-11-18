import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../helpers/utils.dart';
import '../models/auditdata.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';
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

  final signController=SignatureController();
  final repSignController=SignatureController();

  String sectorId = "";
  String sbuId = "";
  String sbuname = "";
  String auditId = "";
  String categoryId = "";
  String companyId = "";
  String locationId = "";
  String userId = "";
  String userName = "";

  List<Auditdata> auditDataDetails = [];


  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
    exportPenColor: Colors.black,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
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

  // Future<void> exportSVG(BuildContext context) async {
  //   if (_controller.isEmpty) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('No content')));
  //     return;
  //   }
  //
  //   final SvgPicture data = _controller.toSVG()!;
  //
  //   await Navigator.of(context).push(
  //     MaterialPageRoute<void>(
  //       builder: (BuildContext context) {
  //         return Scaffold(
  //           appBar: AppBar(),
  //           body: Center(
  //             child: Container(color: Colors.grey[300], child: data),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  //Insert in the AuditData table
  void storeInDb(List<Auditdata> auditDetails) {

     Auditdata(
      strClientfeedback: "",
      strAdditionalinformatin: "",
      clientsign: "",
      auditsign: "",
      auditdate: "",
      userid: "",
      guid: "",
      deviceid: "",
      uploadguid: "",
      uploadfilename: "",
      auditeename: "",
      auditorname: "",
      oamname: "",
      sbuname: "",
      clientperson: "",
      ssano: "",
      sitename: "",
      clientname: "",
      xmldata: "",
      categoryid: "",
      auditid: "",
      sectorid: "",
      locationid: "",
      companyid: "",
      sbuid: "",
      observation: "",
      isfeedback: ""
    );

    

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
    userId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_ID, '');
    userName = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.USER_NAME, '');
    sectorId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SECTOR_ID, '');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: Text(
          'Submit',
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
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
                    SizedBox(height: 10),
                    BoxEditText(placeholder: 'CUSTOMER NAME',
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

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'AUDITOR NAME',
                      controller: auditorNameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/username-8.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'AUDITEE NAME',
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

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'SITE NAME',
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


                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'CLIENT PERSON NAME',
                      controller: clientPersonNameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/username-8.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'SBU NAME',
                      controller: sbuNameController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/username-8.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'OM / AOM / SUPERVISOR',
                      controller: aomController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          'assets/images/username-8.png',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'FEEDBACK TAKENBY',
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

                    SizedBox(height: 20),
                    BoxEditText(placeholder: 'FEEDBACK REP NAME',
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

                    SizedBox(height: 20),
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
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryDark),
                          borderRadius: BorderRadius.circular(8)
                      ),
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
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryDark),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      height: 160,
                      child: Signature(
                        controller: signController,
                        height: 150,
                        backgroundColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 32),
                    CustomButton(
                      buttonText: 'Submit',
                      margin: EdgeInsets.only(bottom: 30),
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
