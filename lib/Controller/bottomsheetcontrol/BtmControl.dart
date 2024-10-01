import 'package:get/get.dart';

import '../../view/bottomsheet/Bestitems.dart';
import '../../view/bottomsheet/Brands.dart';
import '../../view/bottomsheet/categories.dart';
import '../../view/bottomsheet/profile.dart';
import '../../view/homescreen.dart';

class BttmControl extends GetxController {
  var home = false.obs;
  var brands = false.obs;
  var bestitems = false.obs;
  var categories = false.obs;
  var Accounts = false.obs;

  navigatetohome() {
    brands.value = false;
    bestitems.value = false;
    home.value = true;
    categories.value = false;
    Accounts.value = false;
    Get.to((() => HomeScreens()));
  }

  navigatetobrands() {
    brands.value = true;
    bestitems.value = false;
    home.value = false;
    categories.value = false;
    Accounts.value = false;
    Get.to(() => Brands());
  }

  navigatetobestitems() {
    brands.value = false;
    bestitems.value = true;
    home.value = false;
    categories.value = false;
    Accounts.value = false;
    Get.to(() => Bestitems());
  }

  navigatetocategories() {
    brands.value = false;
    bestitems.value = false;
    home.value = false;
    categories.value = true;
    Accounts.value = false;
    Get.to(() => Categories());
  }

  navigatetoAccounts() {
    brands.value = false;
    bestitems.value = false;
    home.value = false;
    categories.value = false;
    Accounts.value = true;
    Get.to(() => Accountss());
  }

  @override
  void onInit() {
    navigatetohome();
    // TODO: implement onInit
    super.onInit();
  }
}
