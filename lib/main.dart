import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urgent_hai/screen/auth/splash_screen.dart';

import 'helper/app_utilities/app_theme.dart';
import 'helper/app_utilities/size_reziser.dart';

void main() {
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: materialPrimaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Urgent Hai',
      theme: defaultAppThemeData,
      home: SplashScreen()
    );
  }
}


