import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:twg/app/data/globals.dart';

import '../controllers/groups_controller.dart';

class GroupsView extends GetView<GroupsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'GroupView Screen Working',
            style: headerTextStyle,
          ),
        ),
      ),
    );
  }
}
