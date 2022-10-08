import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../helpers/colors.dart';
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

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print(widget.data['companyId']);
    print(widget.data['feedbackId']);

    categoryDetails = await DatabaseHelper.instance
        .getCategory(widget.data['companyId']!, widget.data['feedbackId']!);
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
            onTap: () {},
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
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Bangalore',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: categoryDetails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Card(
                        elevation: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${categoryDetails[index]["categoryname"]}',
                              style: TextStyle(fontSize: 18),
                            ),
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
                  Navigator.pushReplacementNamed(context, '/question'),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
