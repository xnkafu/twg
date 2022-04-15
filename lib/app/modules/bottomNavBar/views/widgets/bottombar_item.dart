import 'package:flutter/material.dart';
import 'package:twg/app/data/theme/colors.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title,
      {this.onTap,
      this.color = inActiveColor,
      this.activeColor = primary,
      this.isActive = false,
      this.isNotified = false});
  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                    isActive ? appBgColor.withOpacity(.9) : Colors.transparent,
              ),
              child: Icon(icon,
                  size: 25,
                  color: isActive ? primary : appBgColor.withOpacity(.8))),
          Positioned(
              bottom: -12,
              child: Icon(Icons.arrow_drop_up_rounded,
                  size: 40.0,
                  color: isActive ? primary : appBgColor.withOpacity(.8))),
        ]),
      ),
    );
  }
}
