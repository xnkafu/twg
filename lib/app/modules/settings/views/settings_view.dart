import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/modules/settings/views/widgets/ProfileListWidget.dart';
import 'package:twg/app/widgets/btn_widget.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  final List ProfileItems = [
    {
      "icon": Icons.person_sharp,
      "title": "Edit Profile",
      'showIcon': true,
    },
    {
      "icon": Icons.notifications_active_rounded,
      "title": "Notifications",
      'showIcon': true,
    },
    {
      "icon": Icons.privacy_tip,
      "title": "Privacy",
      'showIcon': true,
    },
    {
      "icon": Icons.logout_sharp,
      //  "colors": Colors.grey,
      "title": "Logout",
      'showIcon': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 50.0,
                  ),
                  child: Center(
                    child: Text(
                      'Profile Settings',
                      style: headerTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      ProfileItems.length,
                      (index) => ProfileListWidget(
                        ProfileItems[index]["icon"],
                        ProfileItems[index]["title"],
                        // show trailing icons
                        showTrailingIcon: ProfileItems[index]['showIcon'],
                        onTap: () {
                          ProfileItems[index]['title'] == 'Edit Profile'
                              ? Get.toNamed('edit_profile')
                              : '';
                          ProfileItems[index]["title"] == 'Favourites'
                              ? Get.toNamed('/favourite')
                              : '';
                          // Privacy
                          ProfileItems[index]["title"] == 'Privacy'
                              ? Get.toNamed('/privacy')
                              : '';

                          // Log Out Conditions
                          ProfileItems[index]["title"] == 'Log Out'
                              ? Get.defaultDialog(
                                  barrierDismissible: true,
                                  // backgroundColor: dark.withOpacity(0.9),
                                  title: 'Are You Sure?',
                                  // middleText: '',
                                  confirm: BtnWidget(
                                      labelText: 'Confirm',
                                      labelColor: MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                      btnColor: MaterialStateProperty.all(
                                        primary,
                                      ),
                                      onPressed: () => {},
                                      icon: Icons.check_circle,
                                      showIcon: false),
                                  cancel: BtnWidget(
                                      labelText: 'Cancel',
                                      labelColor: MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                      btnColor: MaterialStateProperty.all(
                                        Colors.redAccent,
                                      ),
                                      onPressed: () => {},
                                      icon: Icons.cancel_rounded,
                                      showIcon: false),
                                  contentPadding: EdgeInsets.only(
                                    top: 30,
                                    bottom: 30,
                                    right: 20,
                                    left: 20,
                                  ),
                                )
                              : print(
                                  ProfileItems[index]["title"] + ' Clicked',
                                );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
