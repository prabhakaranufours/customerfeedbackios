import 'package:customerfeedbackios/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../helpers/colors.dart';
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
  void get() async{
    categoryDetails = await DatabaseHelper.instance
        .getCategory(widget.data['companyId']!, widget.data['feedbackId']!);

    setState(() {});

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
                    onTap: (){
                      Navigator.pushNamed(context, '/score');
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '${categoryDetails[index]["categoryname"]}',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ),
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
                  Navigator.pushNamed(context, '/question'),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
