// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:twg/app/data/theme/colors.dart';

// Text size config
const xSmallText = 16.0;
const SmallText = 18.0;
const MediumText = 20.0;
const xMediumText = 22.0;
const LargeText = 30.0;
const XLargeText = 34.0;

// text style with custom fonts
final headerTextStyle = TextStyle(
  fontFamily: 'SFProL',
  fontSize: LargeText,
  fontWeight: FontWeight.w600,
  color: textColor,
);

final mediumTextStyle = TextStyle(
  fontFamily: 'SFProM',
  fontSize: MediumText,
  fontWeight: FontWeight.w400,
  color: textColor,
);

final textStyle = TextStyle(
  fontFamily: 'SFProL',
  fontSize: SmallText,
  fontWeight: FontWeight.w400,
  color: textColor,
);

final btnTextStyle = TextStyle(
  fontSize: SmallText,
  fontFamily: 'SFProL',
  fontWeight: FontWeight.w300,
);
