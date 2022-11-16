import 'package:customerfeedbackios/helpers/utils.dart';
import 'package:customerfeedbackios/models/scorecalculation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as math;

import '../database/database_helper.dart';
import '../helpers/colors.dart';
import '../helpers/shared_preferences_helper.dart';
import '../widgets/app_bar.dart';
import '../widgets/button.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String sectorId = "";
  String sbuId = "";
  String auditId = "";
  String categoryId = "";
  String companyId = "";
  String locationId = "";
  String userId = "";
  String selectedAuditId = "";

  double percentage=0;

  List<Map> feedbackDetails = [];
  List<Map> scoreCalculation = [];

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
    sectorId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SECTOR_ID, '');

    //This for get the feedback list
    feedbackDetails = await DatabaseHelper.instance.getFeedback(sectorId);
    scoreCalculation = await DatabaseHelper.instance.getScoreCalculation(sbuId, companyId, locationId, auditId);
    getScoreCalculte(scoreCalculation);
    setState(() {});
  }

  //This method calculate the score and put in progress bar
  getScoreCalculte(List<Map> scoreCalculation) async {
    int? int_score = 0;
    int? int_weight = 0;
    int? scoreWeight = 0;
    int totalWeightage = 0;

    for (int i = 0; i < scoreCalculation.length; i++) {
      // var score = scoreCalculation[i]["score"];
      var score = scoreCalculation[i]["scoreid"];
      var weight = scoreCalculation[i]["weightage"];
      var temp_score = int.parse(score);
      int_score = int_score! + temp_score;
      var temp_weight = int.parse(weight);
      int_weight = int_weight! + temp_weight;
      scoreWeight = temp_score * temp_weight;
      totalWeightage = totalWeightage + scoreWeight!;
    }

    print(int_weight);
    print(totalWeightage);

    //Set the value in progress arc bar
    var final_totalScore = totalWeightage / int_weight!;
    var convertToPercentage = (final_totalScore / 5.0) * 100;


    //Store the total score in shared preference
    await SharedPreferencesHelper.setPrefString(SharedPreferencesHelper.TOTAL_SCORE,
        final_totalScore.toString());
    // final_totalScore = final_totalScore * 100;
    // print(final_totalScore);
    // percentage = (final_totalScore * 3.14) / 100;
    percentage = (convertToPercentage * 3.14) / 100;
    // percentage = 3.14;
    print(percentage);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: Text(
            'Score',
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
              child: Image.asset('assets/images/back arrow-8.png'),
            ),
          ),
        ),
        body: Column(
          children: [
            Utils.subHeader(context, 'Bangalore', 'Audit > Category > Score'),
            Container(
              // height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Circular_arc(percentage),
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: feedbackDetails.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        '${feedbackDetails[index]["auditname"]}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      child: CircularPercentIndicator(
                                        radius: 25.0,
                                        lineWidth: 5.0,
                                        percent: 1.0,
                                        center: auditId ==
                                                feedbackDetails[index]
                                                    ["auditid"]
                                            ? Text(
                                                "100%",
                                                style: TextStyle(fontSize: 12),
                                              )
                                            : Text(
                                                "0%",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                        progressColor: Colors.blue,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    buttonText: 'SUBMIT',
                    onPressed: () => {
                      Navigator.pushNamed(context, '/otp'),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Circular_arc extends StatefulWidget {
  Circular_arc(this.percentage, {Key? key}) : super(key: key);

  double percentage = 0;

  @override
  _Circular_arcState createState() => _Circular_arcState();
}

class _Circular_arcState extends State<Circular_arc>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);

    animation = Tween<double>(begin: 0.0, end: 3.14).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomPaint(
            size: Size(300, 300),
            painter: ProgressArc(null, Colors.black54, true),
          ),
          CustomPaint(
            size: Size(300, 300),
            painter: ProgressArc(widget.percentage, Colors.redAccent, false),
          ),
          Positioned(
            top: 120,
            left: 130,
            child: Text(
              "${(widget.percentage / 3.14 * 100).round()}%",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}

class ProgressArc extends CustomPainter {
  bool isBackground;
  double? arc;
  Color progressColor;

  ProgressArc(this.arc, this.progressColor, this.isBackground);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 300, 300);
    final startAngle = -math.pi;
    // final sweepAngle = -arc != null ? arc : math.pi;
    final sweepAngle = arc ?? math.pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    if (isBackground) {}
    canvas.drawArc(rect, startAngle, sweepAngle, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
}
