import 'package:customerfeedbackios/database/database_helper.dart';
import 'package:customerfeedbackios/helpers/colors.dart';
import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';


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
        appBar: customAppBar(context, title: const Text('Offline Data'),backgroundColor: primaryDark),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView.separated(
            itemCount: offlineList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_city,size: 20),
                            const SizedBox(width: 8,),
                            Text(offlineList[index]["CompanyName"],style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.pin_drop,size: 20),
                            const SizedBox(width: 8,),
                            Text(offlineList[index]["LocationName"],style: const TextStyle(fontWeight: FontWeight.w500),),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.ac_unit,size: 20),
                            const SizedBox(width: 8,),
                            Text(offlineList[index]["auditname"],),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: primaryDark,
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Text(offlineList[index]["count"].toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                        const Text("Image",style: TextStyle(fontSize: 10),),
                      ],
                    ),
                  ],
                ),
              );

            }, separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ));
  }
}
