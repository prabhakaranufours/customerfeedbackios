import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class OfflineDataScreen extends StatefulWidget {
  const OfflineDataScreen({Key? key}) : super(key: key);

  @override
  State<OfflineDataScreen> createState() => _OfflineDataScreenState();
}

class _OfflineDataScreenState extends State<OfflineDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: Text('Offline Data')),
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("I2ISoftwares - Bangalore"),
                        Text("Covid Feedback"),
                        Text("Bangalore"),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
