import 'dart:convert';
import 'dart:developer';

import 'package:alisonprojects/main.dart';
import 'package:alisonprojects/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

import '../../utils/color.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  var loginloading = false.obs;

  login(String username, String password) async {
    try {
      loginloading.value = true;
      print("d");
      var logresponse = await http.post(
        Uri.parse(
            "https://swan.alisonsnewdemo.online/api/login?email_phone=${username}&password=${password}"),
      );
      if (logresponse.statusCode == 200) {
        var responseBody = jsonDecode(logresponse.body);
        var customerData = responseBody['customerdata'];
        var token = customerData['token'];
        var id = customerData['id'];
        var name = customerData['name'];

        var box = Hive.box('userBox');
        box.put('token', token);
        box.put('id', id);
        box.put('name', name);

        MyApp.token = token;
        MyApp.id = id;
        MyApp.name = name;

        log("login response : ${logresponse.body}");
        loginloading.value = false;
        Get.to(() => HomeScreens());
      } else {
        Fluttertoast.showToast(
            msg: "login failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: appblackcolor,
            textColor: appwhitecolor,
            fontSize: 16.0);
        loginloading.value = false;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "${e}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: appblackcolor,
          textColor: appwhitecolor,
          fontSize: 16.0);
      log("error in login : ${e}");
      loginloading.value = false;
    }
  }
}
