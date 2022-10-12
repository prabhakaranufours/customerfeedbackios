import 'package:flutter/material.dart';
import '../helpers/colors.dart';
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
            Utils.subHeader(context, 'Bangalore', 'Audit > Category > Question'),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Column(
                        children: [
                          Text('Was TerminixSis technician visit made as per schedule during lockdown period ?',
                            style: TextStyle(fontSize: 18),),
                          Container(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex:8,
                                child: TextField(
                                  controller: remarksController,
                                ),
                              ),
                              Expanded(
                                flex:2,
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
                          SizedBox(height: 5,)
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
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    remarksController.dispose();
    super.dispose();
  }

  Widget starCreate(){
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

              title: Text("List item $index"));
        });
  }

}
