import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twg/app/data/globals.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    required this.labelText,
    this.btnColor,
    required this.onPressed,
    required this.showIcon,
    this.icon,
    this.labelColor,
  });

  final String labelText;
  final MaterialStateProperty<Color>? btnColor;
  final void Function() onPressed;
  final bool showIcon;
  final IconData? icon;
  final MaterialStateProperty<Color>? labelColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: labelColor,
        backgroundColor: btnColor,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            showIcon
                ? FaIcon(
                    icon,
                    size: MediumText,
                  )
                : SizedBox(),
            Text(
              labelText,
              style: TextStyle(
                fontSize: SmallText,
                fontFamily: 'SFProL',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
