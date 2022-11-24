import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../helpers/shared_preferences_helper.dart';

class OfflineDataScreen extends StatefulWidget {
  const OfflineDataScreen({Key? key}) : super(key: key);

  @override
  State<OfflineDataScreen> createState() => _OfflineDataScreenState();
}

class _OfflineDataScreenState extends State<OfflineDataScreen> {

  String auditId = "";
  String companyId = "";
  String locationId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get();
  }

  void get() async{

    auditId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.FEEDBACK_ID, '');
    companyId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.COMPANY_ID, '');
    locationId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.LOCATION_ID, '');

    await DatabaseHelper.instance.getOfflineData(companyId,locationId,auditId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: Text('Offline Data')),
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(3),
                elevation: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("I2ISoftwares - Bangalore"),
                        Text("Covid Feedback"),
                        Text("Bangalore"),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            color: Colors.orange,
                          ),
                          child: Text("00"),
                        ),
                        Text("Image"),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
