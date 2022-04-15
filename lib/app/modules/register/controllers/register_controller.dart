import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController usernameController,
      firstNameController,
      lastNameController,
      legalStatusController,
      phoneNumberController,
      emailController,
      dobController,
      passwordController;
  var username = '';
  var firstname = '';
  var lastname = '';
  var legalStatus = '';
  var phoneNumber = '';
  var email = '';
  var dob = DateTime.now().obs;
  var password = '';
  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    legalStatusController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    legalStatusController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    dobController.dispose();
    passwordController.dispose();
  }

  // choose DOB
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: dob.value,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Date Of Birth',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      fieldLabelText: 'Date Of Birth',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != dob.value) {
      dob.value = pickedDate;
    }
  }

// disable date
  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  // Name Validations
  String? validateName(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    if (value.length > 10) {
      return "Maximum password characters must be 10";
    } else if (RegExp(r"\s").hasMatch(usernameController.text)) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        elevation: 10,
        backgroundColor: KerrorsColor,
        content: Text(
          'Please enter valid username',
          style: mediumTextStyle,
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 600),
      ));
    }
    return null;
  }

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

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
