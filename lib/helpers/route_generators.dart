import 'package:customerfeedbackios/screens/categoryscreen.dart';
import 'package:customerfeedbackios/screens/downloadscreen.dart';
import 'package:customerfeedbackios/screens/offlinedatascreen.dart';
import 'package:customerfeedbackios/screens/otpverifyscreen.dart';
import 'package:customerfeedbackios/screens/questionscreen.dart';
import 'package:customerfeedbackios/screens/submitscreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/homescreen.dart';
import '../screens/loginscreen.dart';
import '../screens/scorescreen.dart';
import '../screens/splashscreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings, context) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );

      case '/download':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const DownloadScreen(),
            type: PageTransitionType.rightToLeft);

      case '/home':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const HomeScreen(),
            type: PageTransitionType.rightToLeft);

      case '/category':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: CategoryScreen(data: args as Map<String, String>),
            type: PageTransitionType.rightToLeft);

      case '/question':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const QuestionScreen(),
            type: PageTransitionType.rightToLeft);

      case '/score':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const ScoreScreen(),
            type: PageTransitionType.rightToLeft);

      case '/otp':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const OTPVerifyScreen(),
            type: PageTransitionType.rightToLeft);

      case '/submit':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const SubmitScreen(),
            type: PageTransitionType.rightToLeft);

      case '/offline':
        return PageTransition(
          // duration: const Duration(seconds: 1),
            child: const OfflineDataScreen(),
            type: PageTransitionType.rightToLeft);
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
