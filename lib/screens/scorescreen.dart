import 'package:customerfeedbackios/helpers/utils.dart';
import 'package:flutter/material.dart';
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
  List<Map> feedbackDetails = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    get();
  }

  //We cannot write setstate in between didchangeDependencies so write seperate
  void get() async{
    sectorId = await SharedPreferencesHelper.getPrefString(
        SharedPreferencesHelper.SECTOR_ID, '');
    feedbackDetails = await DatabaseHelper.instance.getFeedback(sectorId);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
        customAppBar(
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
            onTap: (){
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
                    child: Circular_arc(),
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: feedbackDetails.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                          },
                          child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  '${feedbackDetails[index]["auditname"]}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                          ),
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
  const Circular_arc({Key? key}) : super(key: key);

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
      child:
      Stack(
        children: [
          CustomPaint(
            size: Size(300, 300),
            painter: ProgressArc(3, Colors.black54, true),
          ),
          CustomPaint(
            size: Size(300, 300),
            painter: ProgressArc(1, Colors.redAccent, false),
          ),
          Positioned(
            top: 120,
            left: 130,
            child: Text("${(1 /3.14 *100).round()}%",
              style: TextStyle(color: Colors.black,
                  fontSize: 30),),
          )
        ],
      ),
    );
  }
}

class ProgressArc extends CustomPainter {
  bool isBackground;
  double arc;
  Color progressColor;

  ProgressArc(this.arc, this.progressColor, this.isBackground);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 300, 300);
    final startAngle = -math.pi;
    final sweepAngle = -arc != null ? arc : math.pi;
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
