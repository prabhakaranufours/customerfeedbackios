import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'helpers/colors.dart';
import 'helpers/notification.dart';
import 'helpers/route_generators.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async {
  //Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseNotification().initialize();

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
        textTheme: GoogleFonts.poppinsTextTheme(),
        // appBarTheme: AppBarTheme(
        //   color: Colors.black,
        //   elevation: 0,
        //   iconTheme: IconThemeData(color: Colors.white),
        //   textTheme: TextTheme().apply(
        //     bodyColor: Colors.white,
        //     displayColor: primary,
        //   ),
        // ),
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: EasyLoading.init(),
      initialRoute: "/",
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings, context),

    );
  }
}
