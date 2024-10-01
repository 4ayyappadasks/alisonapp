import 'dart:async';

import 'package:alisonprojects/main.dart';
import 'package:alisonprojects/view/loginscreens.dart';
import 'package:get/get.dart';

import '../../view/homescreen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToLogin();
  }

  void navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      MyApp.token == ""
          ? Get.to(() => LoginScreen())
          : Get.to(() => HomeScreens());
    });
  }
}
