// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:daimond_app/constants/constant.dart';
import 'package:daimond_app/modal/loginresponcemodal.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Apiservice {
  Future<Uri> getApiURL(String url) async {
    Uri uri = Uri.parse(url);
    return uri;
  }

  static Future loginAPI(
    Map<String, dynamic> perameter,
  ) {
    return http
        .post(
          Uri.parse(LOGIN),
          body: perameter,
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future dashboard() async {
    final prefs = await SharedPreferences.getInstance();
    var userdata = prefs.getString("signinResponse");
    LoginResponseModel user =
        LoginResponseModel.fromJson(jsonDecode(userdata!));

    return http
        .get(
          Uri.parse(DASHBORD),
          headers: {
            'Authorization': "Bearer ${user.data?.token}",
          },
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future fillter() async {
    final prefs = await SharedPreferences.getInstance();
    var userdata = prefs.getString("signinResponse");
    LoginResponseModel user =
        LoginResponseModel.fromJson(jsonDecode(userdata!));

    return http
        .get(
          Uri.parse(FILTER),
          headers: {
            'Authorization': "Bearer ${user.data?.token}",
          },
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future stocksearch(
    Map<dynamic, dynamic> perameter,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var userdata = prefs.getString("signinResponse");
    LoginResponseModel user =
        LoginResponseModel.fromJson(jsonDecode(userdata!));

    return http
        .post(
          Uri.parse(STOCKSEARCH),
          headers: {
            'Authorization': "Bearer ${user.data?.token}",
          },
          body: perameter,
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future saveswipeoption(
    Map<String, dynamic> perameter,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var userdata = prefs.getString("signinResponse");
    print("tokan:$userdata");
    LoginResponseModel user =
        LoginResponseModel.fromJson(jsonDecode(userdata!));
    return http
        .post(
          Uri.parse(SWIPEOPTION),
          headers: {
            'Authorization': "Bearer ${user.data?.token}",
          },
          body: perameter,
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future featuredstones() async {
    final prefs = await SharedPreferences.getInstance();
    var userdata = prefs.getString("signinResponse");
    LoginResponseModel user =
        LoginResponseModel.fromJson(jsonDecode(userdata!));

    return http
        .post(
          Uri.parse(FEATUREDSTONE),
          headers: {
            'Authorization': "Bearer ${user.data?.token}",
          },
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future removeswipe(
    Map<String, dynamic> perameter,
  ) {
    return http
        .post(
          Uri.parse(SWIPEREMOVE),
          body: perameter,
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }

  static Future arrival(
    Map<String, dynamic> perameter,
  ) {
    return http
        .post(
          Uri.parse(ARRIVAL),
          body: perameter,
        )
        .then((response) =>
            response.statusCode == 200 ? jsonDecode(response.body) : null)
        .catchError((error) => debugPrint(error));
  }
}
