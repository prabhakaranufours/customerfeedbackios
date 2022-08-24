import 'dart:convert';

import 'package:dio/dio.dart';

import '../helpers/url_utils.dart';
import '../helpers/utils.dart';
import '../models/loginresponse.dart';

class CustomerFeedbackApiCall {
  static final CustomerFeedbackApiCall _instance =
      CustomerFeedbackApiCall._internal();
  final Dio _dio = Dio();

  factory CustomerFeedbackApiCall() {
    return _instance;
  }

  CustomerFeedbackApiCall._internal() {
    _dio.options.baseUrl = MAIN_URL;
  }

  Future<Loginresponse?> checkLogin(String userName, String password) async {
    var params = {
      'username': userName,
      'pwd': password,
    };

    print('${_dio.options.baseUrl} $loginApi');

    final response = await _dio.get(loginApi, queryParameters: params);

    if ((response.statusCode ?? -1) <= 205) {
      return Loginresponse.fromJson(response.data);
    } else {
      // showToastMsg(response.statusMessage ?? 'Error');
      Utils.showToastMsg("Something went wrong!");
      return null;
    }
  }
}
