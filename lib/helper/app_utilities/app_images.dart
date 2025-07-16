import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class AppImages {
  static String imageExt(String path) => "assets/images/$path";
  static String get appLogo => imageExt("applogo.png");
  static String get urgentHai => imageExt("Urgent_hai.png");
  static String get b1 => imageExt("onboarding1.png");
  static String get b2 => imageExt("onboarding3.png");
  static String get b3 => imageExt("onboarding3.png");




  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
