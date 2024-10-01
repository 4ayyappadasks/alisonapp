import 'dart:convert';
import 'dart:developer';

import 'package:alisonprojects/main.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

import '../../model/homepage_model.dart';
import '../../view/loginscreens.dart';

class HomeScreenController extends GetxController {
  Homedata? homedata;
  var homedataloading = false.obs;

  homedatafunc() async {
    try {
      homedataloading.value = true;
      var homepageresponse = await http.post(Uri.parse(
          "https://swan.alisonsnewdemo.online/api/home?id=${MyApp.id}&token=${MyApp.token}"));
      log("response of home : ${homepageresponse.body}");
      var decode = jsonDecode(homepageresponse.body);
      var msg = decode["message"];
      print(
          "msg:${msg} , homepageresponse.statusCode : ${homepageresponse.statusCode}");
      if (homepageresponse.statusCode == 200 && msg == "Success") {
        homedata = homedataFromJson(homepageresponse.body);
        homedataloading.value = false;
      } else {
        homedataloading.value = false;
        //  if ("${msg}" == "Invalid Token") {
        var box = Hive.box('userBox');
        await box.clear();

        MyApp.token = "";
        MyApp.id = null;
        MyApp.name = null;

        Get.offAll(() => LoginScreen());
        // }
      }
    } catch (e) {
      log("error in home page : ${e}");
      homedataloading.value = false;
    }
  }

  @override
  void onInit() {
    homedatafunc();
    // TODO: implement onInit
    super.onInit();
  }
}
