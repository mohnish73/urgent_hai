import 'package:flutter/material.dart';
import 'package:urgent_hai/helper/app_utilities/app_theme.dart';

import '../../helper/app_utilities/app_images.dart';
import '../../helper/app_utilities/size_reziser.dart';
import '../../helper/dxWidget/dx_text.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    navigationInside();
    super.initState();
  }

  navigationInside() {
    Future.delayed(const Duration(seconds: 3), () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: primaryDarkColor,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.appLogo,
            ),
            SizedBox(
              height: 18,
            ),
            DxTextWhite(
              "Pratham’s",
              mBold: true,
              mSize: 22,
            )
          ],
        ),
      ),
    );
  }
}
