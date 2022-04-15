import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/modules/login/controllers/login_controller.dart';
import 'package:twg/app/widgets/btn_widget.dart';
import 'package:twg/app/widgets/text_form_field.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          // Image.asset(
                          //   "assets/images/app_logo_splash.png",
                          // ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Login To An Account".toUpperCase(),
                            style: headerTextStyle,
                          ),
                          SizedBox(
                            height: 15,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Forgotten Password?',
                                textAlign: TextAlign.right,
                                style: textStyle,
                              ),
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
                                    labelText: 'Login',
                                    labelColor: MaterialStateProperty.all(
                                      Colors.white,
                                    ),
                                    btnColor: MaterialStateProperty.all(
                                      primary,
                                    ),
                                    showIcon: true,
                                    icon: Icons.login,
                                    onPressed: () =>
                                        Get.toNamed('/bottom-nav-bar')

                                    // controller.checkLogin(),
                                    //
                                    ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    textAlign: TextAlign.left,
                                    style: textStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: SizeConfig.screenWidth! * 0.9,
                                child: BtnWidget(
                                  labelText: 'Register',
                                  labelColor: MaterialStateProperty.all(
                                    Colors.white,
                                  ),
                                  btnColor: MaterialStateProperty.all(
                                    secondary,
                                  ),
                                  showIcon: true,
                                  icon: Icons.person_add,
                                  onPressed: () => Get.toNamed('/register'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
