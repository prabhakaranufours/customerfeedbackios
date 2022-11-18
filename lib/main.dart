import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'helpers/colors.dart';
import 'helpers/route_generators.dart';

void main() async {
  runApp(MyApp());
  configLoading();
}

//Loading
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskColor = Colors.black
    ..userInteractions = false
    ..dismissOnTap = false
    ..contentPadding = EdgeInsets.zero
    ..maskType = EasyLoadingMaskType.black
    ..indicatorWidget = ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        'assets/images/loader.gif',
        height: 90,
        width: 90,
        fit: BoxFit.fill,
      ),
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomerFeedback',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        fontFamily: "Sans",
        textTheme: TextTheme(
          headline4: TextStyle(fontSize: 48, letterSpacing: 0.37),
          headline3: TextStyle(fontSize: 62, color: typography1),
          headline2: TextStyle(fontSize: 44),
          headline1: TextStyle(fontSize: 32, color: typography1),
          bodyText2: TextStyle(fontSize: 22, color: typography1),
          bodyText1: TextStyle(fontSize: 16, color: typography1),
          caption: TextStyle(fontSize: 12),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme().apply(
            bodyColor: Colors.white,
            displayColor: primary,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: EasyLoading.init(),
      initialRoute: "/",
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings, context),

    );
  }
}
