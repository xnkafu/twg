import 'package:flutter/material.dart';
import 'package:twg/app/data/config/screen_size_config.dart';
import 'package:twg/app/data/theme/colors.dart';

class HeaderPicture extends StatelessWidget {
  const HeaderPicture({
    this.userImage,
  });

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: SizeConfig.screenWidth! * 0.15,
              backgroundColor: cardColor,
              backgroundImage: AssetImage(
                '/app_logo_splash.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
