import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twg/app/modules/login/userModel.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  var iscurrentUser = bool;
  late Rxn<UserModel> localUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  // String? validateName(String value) {
  //   if (value.length < 8) {
  //     return "Password must be of 8 characters";
  //   }
  //   return null;
  // }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  // vaidate users from user
  // validateUser() {
  //   if(users['person']['eamil'] == emailController.text);
  // }

  checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
