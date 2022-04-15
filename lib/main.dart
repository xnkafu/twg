import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:twg/app/data/theme/app_themes.dart';
import 'package:ots/ots.dart';
import 'package:twg/app/data/theme/colors.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(OTS(
    persistNoInternetNotification: false,
    child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        color: primary,
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.ONBOARDING,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
        ),
        // darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        defaultTransition: Transition.size,
      ),
    ),
  ));
}
