import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';
import 'package:twg/app/modules/editProfile/controllers/edit_profile_controller.dart';
import 'package:twg/app/modules/register/controllers/register_controller.dart';
import 'package:twg/app/widgets/btn_widget.dart';

class EditProfileStepper extends GetView<EditProfileController> {
  final List? items = [
    {'name': 'What is the name of your childhood friend?', 'value': '1'},
    {'name': 'What is the name of your favorite pet?', "value": '2'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.9,
      child: Obx(
        () => Theme(
          data: ThemeData(
            // primaryColor: Colors.red,
            // primarySwatch: Colors.orange,
            colorScheme: ColorScheme.light(
              primary: secondary,
              tertiary: secondary,
              background: secondary,
            ),
          ),
          child: Stepper(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            type: StepperType.horizontal,
            steps: buildStep(),
            currentStep: controller.currentStep.value,
            onStepContinue: () {
              if (controller.currentStep.value == buildStep().length - 1) {
                print("Send data to server");
              } else {
                controller.currentStep.value++;
              }
            },
            onStepCancel: () {
              controller.currentStep.value == 0
                  ? null
                  : controller.currentStep.value--;
            },
            onStepTapped: (index) {
              controller.currentStep.value = index;
            },
            controlsBuilder: (context, ControlsDetails controls,
                {onStepContinue, onStepCancel}) {
              return Container(
                // margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.currentStep.value != 0)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: controls.onStepCancel,
                          label: Text("Previous"),
                          icon: Icon(Icons.arrow_back_rounded),
                          style: ElevatedButton.styleFrom(
                            textStyle: textStyle,
                            primary: secondary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: controls.onStepContinue,
                        label: Text(controller.currentStep.value ==
                                buildStep().length - 1
                            ? "Submit"
                            : "Next"),
                        icon: controller.currentStep.value ==
                                buildStep().length - 1
                            ? Icon(Icons.check_circle_outline)
                            : Icon(Icons.arrow_forward_rounded),
                        style: ElevatedButton.styleFrom(
                          textStyle: textStyle,
                          primary: primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text('User Information'),
          content: Container(
            height: SizeConfig.screenHeight! * 0.49,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "First Name",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Middle Name",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Last Name",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Address",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "SSN",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.document_scanner,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Phone Number",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Email Address",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Emergency Contact Name",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              style: textStyle,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor.withOpacity(.5),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: "Emergency Contact Number",
                                labelStyle: textStyle,
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: textColor,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15.0,
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
                ],
              ),
            ),
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Employment History'),
          content: Container(
            height: SizeConfig.screenHeight! * 0.49,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(
                      'Employee 1',
                      style: mediumTextStyle,
                    ),
                    leading: Icon(
                      Icons.card_travel_sharp,
                      color: textColor,
                    ),
                    collapsedIconColor: textColor,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  style: textStyle,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 1.0,
                                      ),
                                    ),
                                    labelText: "Employee Name",
                                    labelStyle: textStyle,
                                    prefixIcon: Icon(
                                      Icons.person_pin,
                                      color: textColor,
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  style: textStyle,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 1.0,
                                      ),
                                    ),
                                    labelText: "Employee Address",
                                    labelStyle: textStyle,
                                    prefixIcon: Icon(
                                      Icons.person_pin,
                                      color: textColor,
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15.0,
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
                                    .format(
                                        controller.employeeOneStartDate.value)
                                    .toString(),
                                style: textStyle,
                              ),
                            ),
                          ),
                          BtnWidget(
                            labelText: 'Start Date',
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
                                    .format(controller.employeeOneEndDate.value)
                                    .toString(),
                                style: textStyle,
                              ),
                            ),
                          ),
                          BtnWidget(
                            labelText: 'End Date',
                            onPressed: () {
                              controller.chooseEndDate();
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
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  style: textStyle,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 1.0,
                                      ),
                                    ),
                                    labelText: "Employee Phone Number",
                                    labelStyle: textStyle,
                                    prefixIcon: Icon(
                                      Icons.person_pin,
                                      color: textColor,
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.card_travel_sharp,
                      color: textColor,
                    ),
                    initiallyExpanded: false,
                    title: Text(
                      'Employee 2',
                      style: mediumTextStyle,
                    ),
                    collapsedIconColor: textColor,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  style: textStyle,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 1.0,
                                      ),
                                    ),
                                    labelText: "Employee Name",
                                    labelStyle: textStyle,
                                    prefixIcon: Icon(
                                      Icons.person_pin,
                                      color: textColor,
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  style: textStyle,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 2.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: textColor.withOpacity(.5),
                                        width: 1.0,
                                      ),
                                    ),
                                    labelText: "Employee Address",
                                    labelStyle: textStyle,
                                    prefixIcon: Icon(
                                      Icons.person_pin,
                                      color: textColor,
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 15.0,
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
                                    .format(
                                        controller.employeeTwoStartDate.value)
                                    .toString(),
                                style: textStyle,
                              ),
                            ),
                          ),
                          BtnWidget(
                            labelText: 'Start Date',
                            onPressed: () {
                              controller.chooseDate2();
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
                                    .format(controller.employeeTwoEndDate.value)
                                    .toString(),
                                style: textStyle,
                              ),
                            ),
                          ),
                          BtnWidget(
                            labelText: 'End Date',
                            onPressed: () {
                              controller.chooseEndDate2();
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: 0.0, right: 0.0, top: 10.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                style: textStyle,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: textColor.withOpacity(.5),
                                      width: 2.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: textColor.withOpacity(.5),
                                      width: 1.0,
                                    ),
                                  ),
                                  labelText: "Employee Phone Number",
                                  labelStyle: textStyle,
                                  prefixIcon: Icon(
                                    Icons.person_pin,
                                    color: textColor,
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: Text('Security'),
          content: Container(
            // height: SizeConfig.screenHeight! * 0.49,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  Container(
                      // child: DropdownButton(
                      //   icon: Icon(Icons.keyboard_arrow_down_rounded),
                      //   isExpanded: true,
                      //   value: controller.selected.value.toString(),
                      //   items: items!.map((e) {
                      //     return DropdownMenuItem(
                      //       value: e['value'],
                      //       child: Text(
                      //         e['name'],
                      //         style: textStyle,
                      //       ),
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) {
                      //     controller.selected.value = value.toString();
                      //   },
                      // ),
                      ),
                ],
              ),
            ),
          ),
          isActive: controller.currentStep.value >= 2)
    ];
  }
}
