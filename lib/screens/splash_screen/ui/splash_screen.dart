import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

 import '../../../routes/routes_name_app.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    if (token == null) {
      context.goNamed(AppRouteConstants.introName);

    } else {
      context.goNamed(AppRouteConstants.mobileBottomNavName);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
            Image.asset(AppImages.splashIcon,height: 64.w,width: 64.w,),
            Text(
              AppStrings.prathams,
              style: Theme.of(context).textTheme.urbanistItalicBoldWhite18,

            ),
          ],
        ),
      ),
    );
  }
}
