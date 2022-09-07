import 'dart:convert';

import 'package:customerfeedbackios/models/categorydetails.dart';
import 'package:dio/dio.dart';

import '../helpers/url_utils.dart';
import '../helpers/utils.dart';
import '../models/auditdetails.dart';
import '../models/companydetails.dart';
import '../models/locationdetails.dart';
import '../models/loginresponse.dart';
import '../models/sbudetails.dart';

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

  //Login API
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

  //SBUDetails API
  Future<Sbudetails?> getSbu(String userid) async {
    var params = {
      'userid': userid,
    };

    print('${_dio.options.baseUrl} $sbuApi');
    final response = await _dio.get(sbuApi, queryParameters: params);

    if ((response.statusCode ?? -1) <= 205) {
      return Sbudetails.fromJson(response.data);
    } else {
      // showToastMsg(response.statusMessage ?? 'Error');
      Utils.showToastMsg("Something went wrong!");
      return null;
    }
  }

  //CompanyDetails API
  Future<Companydetails?> getCompanyDetails(String userId) async {
    var params = {
      'userid': userId,
    };

    print('${_dio.options.baseUrl} $companyApi');
    final response = await _dio.get(companyApi, queryParameters: params);

    if ((response.statusCode ?? -1) <= 205) {
      return Companydetails.fromJson(response.data);
    } else {
      // showToastMsg(response.statusMessage ?? 'Error');
      Utils.showToastMsg("Something went wrong!");
      return null;
    }
  }

  //LocationDetails API
  Future<Locationdetails?> getLocationDetails(String userId) async {
    var params = {
      'userid': userId,
    };

    print('${_dio.options.baseUrl} $locationApi');
    final response = await _dio.get(locationApi, queryParameters: params);

    if ((response.statusCode ?? -1) <= 205) {
      return Locationdetails.fromJson(response.data);
    } else {
      // showToastMsg(response.statusMessage ?? 'Error');
      Utils.showToastMsg("Something went wrong!");
      return null;
    }
  }

  //AuditDetails API
  Future<Auditdetails?> getAuditDetails(String userId) async {
    var params = {
      'userid': userId,
      'type': '1',
      'date': '2016-10-08 00:00:00.000',
    };

    print('${_dio.options.baseUrl} $auditApi');
    final response = await _dio.get(auditApi, queryParameters: params);

    if ((response.statusCode ?? -1) <= 205) {
      return Auditdetails.fromJson(response.data);
    } else {
      Utils.showToastMsg("Something went wrong!");
      return null;
    }
  }

  //AuditDetails API
  Future<Categorydetails?> getCategoryDetails(String userId) async {
    var params = {
      'userid': userId,
      'type': '1',
      'date': '2016-10-08 00:00:00.000',
    };

    print('${_dio.options.baseUrl} $categoryApi');
    final response = await _dio.get(categoryApi, queryParameters: params);

    if ((response.statusCode ?? -1) <= 205) {
      return Categorydetails.fromJson(response.data);
    } else {
      Utils.showToastMsg("Something went wrong!");
      return null;
    }
  }
}




