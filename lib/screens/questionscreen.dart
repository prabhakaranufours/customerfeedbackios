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
            style: Theme
                .of(context)
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
            Utils.subHeader(
                context, 'Bangalore', 'Audit > Category > Question'),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      title: Column(
                        children: [
                        Text(
                        ' Was TerminixSis technician visit made as per schedule during lockdown period ?',
                        style: TextStyle(fontSize: 18),
                      ),
                    //   Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children:
                    //       // List.generate(
                    //       //     6,
                    //       //         (index) =>
                    //       //     index == 5 ? CustomButton(
                    //       //       buttonText: 'N/A',
                    //       //       borderColor: Colors.grey,
                    //       //       width: 25,
                    //       //       height: 25,
                    //       //       onPressed: () =>
                    //       //       {
                    //       //         Navigator.pop(context),
                    //       //       },
                    //       //     ) :
                    //       //     ImageIcon(
                    //       //       AssetImage("assets/images/one.png"),
                    //       //       // color: Color(0xFF3A5A98),
                    //       //     ),
                    //       // ),
                    //
                    //
                    //
                    // ),

                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextField(
                            controller: remarksController,
                          ),
                        ),
                        Expanded(
                          flex: 2,
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
                    SizedBox(
                      height: 5,
                    )
                    ],
                  ),)
                  ,
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: CustomButton(
                buttonText: 'Submit Audit',
                onPressed: () =>
                {
                  Navigator.pop(context),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Emoji row
  Widget emojiRow() {
    return Row(
      children: [
        ImageIcon(
          AssetImage("assets/images/one.png"),
          // color: Color(0xFF3A5A98),
        ),
      ],
    );
  }

  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    remarksController.dispose();
    super.dispose();
  }

  Widget starCreate() {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
              child: new Icon(
                Icons.star,
                color: _rating >= 1 ? Colors.orange : Colors.grey,
              ),
              onTap: () => rate(1),
            ),
          );
        });
  }
}
