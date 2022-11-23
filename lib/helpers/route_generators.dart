import 'package:customerfeedbackios/screens/categoryscreen.dart';
import 'package:customerfeedbackios/screens/downloadscreen.dart';
import 'package:customerfeedbackios/screens/offlinedatascreen.dart';
import 'package:customerfeedbackios/screens/otpverifyscreen.dart';
import 'package:customerfeedbackios/screens/questionscreen.dart';
import 'package:customerfeedbackios/screens/submitscreen.dart';
import 'package:flutter/material.dart';

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
        return MaterialPageRoute(
          builder: (_) => DownloadScreen(),
          settings: settings,
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );

      case '/category':
        return MaterialPageRoute(
          // builder: (_) => CategoryScreen(companyId: String, auditId: args),
          builder: (_) => CategoryScreen(data: args as Map<String, String>),
          settings: settings,
        );

      case '/question':
        return MaterialPageRoute(
          builder: (_) => QuestionScreen(),
          settings: settings,
        );

      case '/score':
        return MaterialPageRoute(
          builder: (_) => ScoreScreen(),
          settings: settings,
        );
      case '/otp':
        return MaterialPageRoute(
          builder: (_) => OTPVerifyScreen(),
          settings: settings,
        );

      case '/submit':
        return MaterialPageRoute(
          builder: (_) => SubmitScreen(),
          settings: settings,
        );

      case '/offline':
        return MaterialPageRoute(
          builder: (_) => OfflineDataScreen(),
          settings: settings,
        );
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
