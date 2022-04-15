import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twg/app/data/globals.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            child: Text(
              'Dashboard Screen',
              style: headerTextStyle,
            ),
            onTap: () => Get.toNamed('/edit_profile'),
          ),
        ),
      ),
    );
  }
}
