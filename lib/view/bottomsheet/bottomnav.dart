import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/bottomsheetcontrol/BtmControl.dart';
import '../../utils/color.dart';

class BtmNav extends StatelessWidget {
  const BtmNav({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BttmControl());

    return Obx(
      () {
        return Material(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: appwhitecolor,
              boxShadow: [BoxShadow(color: appblackcolor.withOpacity(.5))],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildNavItem(
                  icon: Icons.home,
                  label: "Home",
                  isSelected: controller.home.value,
                  onTap: () {
                    controller.navigatetohome();
                  },
                ),
                buildNavItem(
                  icon: Icons.airplane_ticket,
                  label: "Brands",
                  isSelected: controller.brands.value,
                  onTap: () {
                    controller.navigatetobrands();
                  },
                ),
                buildNavItem(
                  icon: Icons.star,
                  label: "Best Items",
                  isSelected: controller.bestitems.value,
                  onTap: () {
                    controller.navigatetobestitems();
                  },
                ),
                buildNavItem(
                  icon: Icons.apps,
                  label: "Categories",
                  isSelected: controller.categories.value,
                  onTap: () {
                    controller.navigatetocategories();
                  },
                ),
                buildNavItem(
                  icon: Icons.person,
                  label: "Account",
                  isSelected: controller.Accounts.value,
                  onTap: () {
                    controller.navigatetoAccounts();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// bottom widget

  Widget buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? appprimary : appblackcolor.withOpacity(.5),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? appprimary : appblackcolor.withOpacity(.5),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
