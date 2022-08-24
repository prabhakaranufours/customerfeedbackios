import 'dart:convert';
import 'dart:io';

import 'package:customerfeedbackios/helpers/url_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/loginresponse.dart';
import 'utils.dart';

// Future<Loginresponse> getLoginDetail(
//     String email, String password, BuildContext context) async {
//   Map<String, String> body = {
//     'username': email,
//     'pwd': password,
//   };
//   //print(body);
//   // final uri = Uri.http(MAIN_URL, URL_LOGIN, body);
//
//   // final uri = Uri.parse(MAIN_URL);
//   final uri = Uri.http(MAIN_URL + URL_LOGIN + "?username = 'email'&pwd=' '");
//   http.Response response = await http.get(uri);
//
//   var dio = Dio();
//   dio.options.connectTimeout = 70000;
//
//   try {
//     var response = await dio.getUri(uri,
//         options: Options(headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         }));
//     Utils.hideLoader();
//     return Loginresponse.fromJson(response.data);
//   } catch (e) {
//     Utils.hideLoader();
//     Utils.showToastMsg("Something went wrong!", context);
//     throw Exception(e.toString());
//   }
// }
