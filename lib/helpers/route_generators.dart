import 'package:customerfeedbackios/screens/downloadscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../screens/homescreen.dart';
import '../screens/loginscreen.dart';
import '../screens/splashscreen.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings, context) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return platformPageRoute(
          context: context,
          builder: (_) => SplashScreen(),
          settings: settings,
        );
      case '/login':
        return platformPageRoute(
          context: context,
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case '/download':
        return platformPageRoute(
          context: context,
          builder: (_) => DownloadScreen(),
          settings: settings,
        );
      case '/home':
        return platformPageRoute(
          context: context,
          builder: (_) => HomeScreen(),
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
