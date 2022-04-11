import 'package:flutter/material.dart';
import 'package:twg/app/data/globals.dart';
import 'package:twg/app/data/theme/colors.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget(
    this.icon,
    this.title, {
    this.showTrailingIcon = true,
    this.trailingWidget,
    this.onTap,
  });
  final IconData? icon;
  final bool? showTrailingIcon;
  final Widget? trailingWidget;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: InkWell(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: secondary.withOpacity(0.07),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(2, 0),
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: textColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Icon(
                      icon,
                      color: secondary.withOpacity(.9),
                    )),
                title: Text(
                  title,
                  style: textStyle,
                ),
                trailing: showTrailingIcon!
                    ? Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: textColor,
                      )
                    : trailingWidget,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
