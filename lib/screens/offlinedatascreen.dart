import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/helpers/colors.dart';
import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../helpers/shared_preferences_helper.dart';

class OfflineDataScreen extends StatefulWidget {
  const OfflineDataScreen({Key? key}) : super(key: key);

  @override
  State<OfflineDataScreen> createState() => _OfflineDataScreenState();
}

class _OfflineDataScreenState extends State<OfflineDataScreen> {

  List<Map> offlineList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  void get() async{

    offlineList =  await DatabaseHelper.instance.getOfflineData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: Text('Offline Data'),backgroundColor: primaryDark),
        body: Container(
          child: ListView.builder(
            itemCount: offlineList.length,
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
                        Text(offlineList[index]["CompanyName"]),
                        Text(offlineList[index]["auditname"]),
                        Text(offlineList[index]["LocationName"]),
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
