

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static final String IS_LOGIN = "is_login";
  static final String LOGIN_RESPONSE = "login_response";
  static final String USER_EMAIL = "USER_EMAIL";
  static final String USER_PASSWORD = "USER_PASSWORD";
  static final String USER_ID = "USER_ID";
  static final String COMPANY_ID = "COMPANY_ID";
  static final String SBU_ID = "SBU_ID";
  static final String LOCATION_ID = "LOCATION_ID";
  static final String FEEDBACK_ID = "FEEDBACK_ID";
  static final String SECTOR_ID = "SECTOR_ID";
  static final String CATEGORY_ID = "CATEGORY_ID";
  static final String AUDIT_ID = "AUDIT_ID";
  static final String SETTING_DETAILS = "SETTING_DETAILS";

  static final String DEPARTMENTID = "DEPARTMENT_ID";
  static final String DEPARTMENTNAME = "DEPARTMENT_NAME";

  static final String selectedCompany = "SelectedCompany";
  static final String selectedLocation = "SelectedLocation";
  static final String selectedBuilding = "SelectedBuilding";
  static final String selectedFloor = "SelectedFloor";



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
