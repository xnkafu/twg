import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/modules/editProfile/views/widgets/edit_profile_stepper.dart';
import 'package:twg/app/widgets/btn_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: SizeConfig.screenHeight!,
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_outlined,
                                  size: 22,
                                  color: textColor,
                                ),
                                Text(
                                  'Back',
                                  style: textStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  Center(
                    child: Text(
                      'Edit Profile'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: headerTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Stack(fit: StackFit.loose, children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Obx(
                            () => CircleAvatar(
                              radius: SizeConfig.screenWidth! * 0.2,
                              backgroundColor: bgColor,
                              backgroundImage: editProfileController
                                          .isProfilePicPathSet.value ==
                                      true
                                  ? FileImage(File(editProfileController
                                      .profilePicPath.value)) as ImageProvider
                                  : AssetImage(
                                      'assets/images/avatar_profile.png',
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0, right: 110.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: textColor,
                                radius: 20.0,
                                child: InkWell(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: bgColor,
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      )),
                                      elevation: 2,
                                      backgroundColor: bgColor,
                                      enableDrag: true,
                                      context: context,
                                      builder: (context) =>
                                          bottomSheet(context),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),
                    ]),
                  ),
                ],
              ),
            ),
            EditProfileStepper()
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.9,
      height: SizeConfig.screenHeight! * 0.25,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Choose Picture',
            style: headerTextStyle,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 40.0,
                      color: textColor,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('Gallery', style: textStyle),
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 70.0,
              ),
              GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      size: 40.0,
                      color: textColor,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text('Camera', style: textStyle)
                  ],
                ),
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    editProfileController.setProfileImagePath(pickedFile!.path);

    Get.back();
    // print(pickedFile);
  }
}

Widget _getActionButtons() {
  return Padding(
    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Container(
                height: SizeConfig.screenHeight! * 0.06,
                child: BtnWidget(
                  labelText: 'Save',
                  labelColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  btnColor: MaterialStateProperty.all(
                    primary,
                  ),
                  showIcon: true,
                  icon: Icons.save_sharp,
                  onPressed: () => {},
                )),
          ),
          flex: 2,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
                height: SizeConfig.screenHeight! * 0.06,
                child: BtnWidget(
                  labelText: 'Cancel',
                  labelColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  btnColor: MaterialStateProperty.all(
                    KerrorsColor,
                  ),
                  showIcon: true,
                  icon: Icons.cancel_sharp,
                  onPressed: () => {},
                )),
          ),
          flex: 2,
        ),
      ],
    ),
  );
}
