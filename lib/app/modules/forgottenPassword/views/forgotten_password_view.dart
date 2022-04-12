import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:twg/app/data/globals.dart';

import '../controllers/forgotten_password_controller.dart';

class ForgottenPasswordView extends GetView<ForgottenPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'ForgottenPasswordView Screen Working',
            style: mediumTextStyle,
          ),
        ),
      ),
    );
  }
}
