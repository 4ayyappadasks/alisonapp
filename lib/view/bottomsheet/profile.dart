import 'package:alisonprojects/view/loginscreens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Controller/bottomsheetcontrol/BtmControl.dart';
import '../../main.dart';
import 'bottomnav.dart';

class Accountss extends StatelessWidget {
  const Accountss({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Get.find<BttmControl>().navigatetohome();
      },
      child: Scaffold(
        bottomNavigationBar: BtmNav(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Profile"),
              TextButton(
                  onPressed: () async {
                    var box = Hive.box('userBox');
                    await box.clear();
                    MyApp.token = "";
                    MyApp.id = null;
                    MyApp.name = null;
                    Get.offAll(() => LoginScreen());
                  },
                  child: Text("Log out"))
            ],
          ),
        ),
      ),
    );
  }
}
