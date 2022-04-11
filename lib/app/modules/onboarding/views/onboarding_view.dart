import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/widgets/btn_widget.dart';
// import 'package:video_player/video_player.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  // late final double _appbarSize;
  @override
  Widget build(BuildContext context) {
    // OnboardingController controller =
    //     Get.put<OnboardingController>(OnboardingController());

    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Center(
          child: Container(
            height: SizeConfig.screenHeight! * 0.9,
            width: SizeConfig.screenWidth!,
            color: Colors.transparent,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.selectedPageIndex,
              itemCount: controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          height: SizeConfig.screenHeight! * 0.9,
                          width: SizeConfig.screenWidth! * 0.85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      'Skip >>',
                                      textAlign: TextAlign.right,
                                      style: mediumTextStyle,
                                    ),
                                    onTap: () {
                                      Get.toNamed('/register');
                                    },
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * 0.02,
                                  ),
                                  Container(
                                      width: 300,
                                      height: 300,
                                      child: Image.asset(controller
                                          .onboardingPages[index].image)),
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * 0.02,
                                  ),
                                  Text(
                                    controller.onboardingPages[index].title,
                                    style: headerTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * 0.02,
                                  ),
                                  Text(
                                    controller
                                        .onboardingPages[index].description,
                                    textAlign: TextAlign.center,
                                    style: mediumTextStyle,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    // height: SizeConfig.screenHeight! * 0.16,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 10.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            controller.onboardingPages.length,
                                            (index) => Obx(() {
                                              return Container(
                                                width: SizeConfig.screenWidth! *
                                                    0.06,
                                                height:
                                                    SizeConfig.screenHeight! *
                                                        0.01,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: controller
                                                                .selectedPageIndex
                                                                .value ==
                                                            index
                                                        ? secondary
                                                        : primary
                                                            .withOpacity(0.5),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.0,
                                                    )),
                                              );
                                            }),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.screenHeight! * 0.02,
                                        ),
                                        Container(
                                          width: SizeConfig.screenWidth! * 0.8,
                                          child: BtnWidget(
                                            labelText: 'Get Started',
                                            labelColor:
                                                MaterialStateProperty.all(
                                              Colors.white,
                                            ),
                                            btnColor: MaterialStateProperty.all(
                                              primary,
                                            ),
                                            showIcon: false,
                                            onPressed: () =>
                                                Get.toNamed('/register'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
