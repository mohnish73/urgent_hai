import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get defaultAppThemeData => ThemeData(
  fontFamily: AppFonts.textRegular,
  primarySwatch: materialPrimaryColor,
  hintColor: materialAccentColor,
  useMaterial3: false,
  scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
  appBarTheme: const AppBarTheme().copyWith(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
  platform: TargetPlatform.android,
  iconTheme: const IconThemeData(color: Colors.white),
  primaryIconTheme: const IconThemeData(color: Colors.white),
);

const MaterialColor materialPrimaryColor =
    MaterialColor(0xff0BBE5E, <int, Color>{
      50: Color(0xff0BBE5E),
      100: Color(0xff0BBE5E),
      200: Color(0xff0BBE5E),
      300: Color(0xff0BBE5E),
      400: Color(0xff0BBE5E),
      500: Color(0xff0BBE5E),
      600: Color(0xff0BBE5E),
      700: Color(0xff0BBE5E),
      800: Color(0xff0BBE5E),
      900: Color(0xff0BBE5E),
    });

/*
* New colors added
* */

Color get primaryDarkColor => materialPrimaryColor;

Color get primaryColor => Color(0xffAEDC81);

Color get primaryLightColor => Color(0xffEDFAF1);

Color get materialAccentColor => Color(0xffEC6518);

Color get linkColor => const Color(0xff1A0DAB);

Color get borderSideColor => Colors.black26;

Color get borderSideFocusedColor => primaryColor;

Color get lightGrey50 => Colors.grey.shade50;

Color get whiteColor => Colors.white;

abstract class AppFonts {
  static String textRegular = 'textRegular';
  static String textBold = 'textBold';
  static String textSemiBold = 'textSemiBold';
}
