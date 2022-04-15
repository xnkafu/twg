import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/modules/register/controllers/register_controller.dart';
import 'package:twg/app/widgets/btn_widget.dart';
import 'package:twg/app/widgets/text_form_field.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 15.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: Form(
                    key: controller.loginFormKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Create An Account".toUpperCase(),
                          style: headerTextStyle,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormFieldWidget(
                          labelText: 'Username',
                          showIcon: true,
                          icon: Icons.person,
                          keyboardType: TextInputType.text,
                          controller: controller.usernameController,
                          onSaved: (value) {
                            controller.username = value!;
                          },
                          validator: (value) {
                            return controller.validateName(value!);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWidget(
                          labelText: 'First Name',
                          showIcon: true,
                          icon: Icons.person,
                          keyboardType: TextInputType.text,
                          controller: controller.firstNameController,
                          onSaved: (value) {
                            controller.firstname = value!;
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWidget(
                          labelText: 'Last Name',
                          showIcon: true,
                          icon: Icons.person,
                          keyboardType: TextInputType.text,
                          controller: controller.lastNameController,
                          onSaved: (value) {
                            controller.lastname = value!;
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWidget(
                          labelText: 'Legal Status',
                          showIcon: true,
                          icon: Icons.personal_injury,
                          keyboardType: TextInputType.text,
                          controller: controller.legalStatusController,
                          onSaved: (value) {
                            controller.legalStatus = value!;
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWidget(
                          labelText: 'Phone Number',
                          showIcon: true,
                          icon: Icons.phone,
                          keyboardType: TextInputType.number,
                          controller: controller.phoneNumberController,
                          onSaved: (value) {
                            controller.phoneNumber = value!;
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWidget(
                          labelText: 'Email Address',
                          showIcon: true,
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormFieldWidget(
                          labelText: 'Password',
                          showIcon: true,
                          icon: Icons.lock,
                          keyboardType: TextInputType.text,
                          controller: controller.passwordController,
                          onSaved: (value) {
                            controller.password = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 50.0,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                    border: Border.all(
                                      color: textColor.withOpacity(.5),
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                    )),
                                child: Text(
                                  DateFormat('dd-MM-yyyy')
                                      .format(controller.dob.value)
                                      .toString(),
                                  style: textStyle,
                                ),
                              ),
                            ),
                            BtnWidget(
                              labelText: 'Date Of birth',
                              onPressed: () {
                                controller.chooseDate();
                              },
                              showIcon: true,
                              icon: Icons.date_range,
                              btnColor: MaterialStateProperty.all(
                                primary,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth! * 0.9,
                              child: BtnWidget(
                                labelText: 'Register An Account',
                                labelColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                btnColor: MaterialStateProperty.all(
                                  primary,
                                ),
                                showIcon: true,
                                icon: Icons.person_add,
                                onPressed: () => Get.toNamed('/login'),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  child: Text(
                                    'Have an account?',
                                    textAlign: TextAlign.right,
                                    style: textStyle,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: SizeConfig.screenWidth! * 0.9,
                              child: BtnWidget(
                                labelText: 'Login',
                                labelColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                                btnColor: MaterialStateProperty.all(
                                  secondary,
                                ),
                                showIcon: true,
                                icon: Icons.login,
                                onPressed: () => Get.toNamed('/login'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
