import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  late TextEditingController dobController;
  var dob = DateTime.now().obs;

  // Security Question
  final selected = ''.obs;

  List securityQuestion = [
    'What is the name of your best friend?',
    'What is your favorite pet?',
    'who is favorite celebrity?',
  ];

  void setSelected(String value) {
    selected.value = value;
  }

  var currentStep = 0.obs;
  late TextEditingController employeeOneStartDateController;
  late TextEditingController employeeOneEndDateController;

  late TextEditingController employeeTwoStartDateController;
  late TextEditingController employeeTwoEndDateController;

  var employeeOneStartDate = DateTime.now().obs;
  var employeeOneEndDate = DateTime.now().obs;

  var employeeTwoStartDate = DateTime.now().obs;
  var employeeTwoEndDate = DateTime.now().obs;

  // Profile Picture Controller
  var isProfilePicPathSet = false.obs;
  var profilePicPath = ''.obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }

  // choose employeeOneStartDate
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: employeeOneStartDate.value,
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
    if (pickedDate != null && pickedDate != employeeOneStartDate.value) {
      employeeOneStartDate.value = pickedDate;
    }
  }

  // choose employeeOneEndDate
  chooseEndDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: employeeOneEndDate.value,
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
    if (pickedDate != null && pickedDate != employeeOneEndDate.value) {
      employeeOneEndDate.value = pickedDate;
    }
  }

  // choose employeeTwoStartDate
  chooseDate2() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: employeeOneStartDate.value,
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
    if (pickedDate != null && pickedDate != employeeTwoStartDate.value) {
      employeeTwoStartDate.value = pickedDate;
    }
  }

  // choose employeeTwoEndDate
  chooseEndDate2() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: employeeTwoEndDate.value,
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
    if (pickedDate != null && pickedDate != employeeTwoEndDate.value) {
      employeeTwoEndDate.value = pickedDate;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    dobController = TextEditingController();
    employeeOneStartDateController = TextEditingController();
    employeeOneEndDateController = TextEditingController();
    employeeTwoStartDateController = TextEditingController();
    employeeTwoEndDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dobController.dispose();
    employeeOneStartDateController.dispose();
    employeeOneEndDateController.dispose();
    employeeTwoStartDateController.dispose();
    employeeTwoEndDateController.dispose();
  }
}
