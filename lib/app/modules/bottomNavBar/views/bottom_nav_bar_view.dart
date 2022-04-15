// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/modules/bottomNavBar/controllers/theme_controller.dart';
import 'package:twg/app/modules/bottomNavBar/views/widgets/bottombar_item.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  final List barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      // "page": HomePage(),
      "title": ""
    },
    {
      "icon": Icons.account_balance_wallet_outlined,
      "active_icon": Icons.account_balance_wallet,
      // "page": ExplorePage(),
      "title": ""
    },
    {
      "icon": Icons.import_export_outlined,
      "active_icon": Icons.import_export_sharp,
      // "page": ExplorePage(),
      "title": ""
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      // "page": HomePage(),
      "title": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    ThemeController themeController =
        Get.put<ThemeController>(ThemeController());
    BottomNavBarController controller =
        Get.put<BottomNavBarController>(BottomNavBarController());

    SizeConfig().init(context); // initializing size config
    return Obx(
      () => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Scaffold(
            body: Container(
              child: controller.currentPage,
            ),
            floatingActionButton: getBottomBar(themeController),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
          )),
    );
  }

  Widget getBottomBar(ThemeController themeController) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20, 0, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20)
        // ),
        boxShadow: [
          BoxShadow(
            color: secondary.withOpacity(.5),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          )
        ],
        color: secondary.withOpacity(.8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          barItems.length,
          (index) => BottomBarItem(
            controller.activeTab == index
                ? barItems[index]["active_icon"]
                : barItems[index]["icon"],
            "",
            isActive: controller.activeTab == index,
            activeColor: secondary,
            onTap: () {
              controller.changePage(index);
            },
          ),
        ),
      ),
    );
  }
}
