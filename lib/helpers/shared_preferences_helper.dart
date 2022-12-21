

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static const String IS_LOGIN = "is_login";
  static const String IS_FEEDBACK = "is_feedback";
  static const String COMPANY_LOGO = "comp_logo";
  static const String LOGIN_RESPONSE = "login_response";
  static const String USER_EMAIL = "USER_EMAIL";
  static const String USER_PASSWORD = "USER_PASSWORD";
  static const String USER_ID = "USER_ID";
  static const String USER_NAME = "USER_NAME";
  static const String COMPANY_ID = "COMPANY_ID";
  static const String COMPANY_NAME = "COMPANY_NAME";
  static const String SBU_ID = "SBU_ID";
  static const String SBU_NAME = "SBU_NAME";
  static const String LOCATION_ID = "LOCATION_ID";
  static const String LOCATION_NAME = "LOCATION_NAME";
  static const String FEEDBACK_ID = "FEEDBACK_ID";
  static const String FEEDBACK_NAME = "FEEDBACK_NAME";
  static const String SECTOR_ID = "SECTOR_ID";
  static const String CATEGORY_ID = "CATEGORY_ID";
  static const String AUDIT_ID = "AUDIT_ID";
  static const String TOTAL_SCORE = "TOTAL_SCORE";

  static const String SETTING_DETAILS = "SETTING_DETAILS";

  static const String DEPARTMENTID = "DEPARTMENT_ID";
  static const String DEPARTMENTNAME = "DEPARTMENT_NAME";

  static const String selectedCompany = "SelectedCompany";
  static const String selectedLocation = "SelectedLocation";
  static const String selectedBuilding = "SelectedBuilding";
  static const String selectedFloor = "SelectedFloor";



  static String selectedUser = "";

  static Future<String> getPrefString(String key, String defaultVal) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultVal;
  }

  static Future<bool> setPrefString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }


  static Future<bool> getPrefBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<bool> setPrefBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  static Future<bool> logoutPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
