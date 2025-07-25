import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/custom_widgets/custom_app_button.dart';
import 'package:urgenthai/custom_widgets/custom_bounce.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

import '../provider/auth_provider.dart';
import 'components/back_button.dart';
import 'components/otp_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  void initState() {
    super.initState();
    // Start the OTP timer when the screen opens
    Future.delayed(Duration.zero, () {
      Provider.of<AuthProvider>(context, listen: false).startOtpTimer();
    });
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Padding(
        padding:   EdgeInsets.all(20.0.w),
        child: ListView(children: [

          backButton(context:context),

          Image.asset(AppImages.prathamGreenIcon,height: 64.w,width: 64.w,),
          SizedBox(height: 28.h,),

          Text(
            AppStrings.enterOTP,
            style: Theme.of(context).textTheme.urbanistTitle30,
          ),
          SizedBox(height: 30.h,),
          CustomOtpInput(
            onCompleted: (pin) {
              print('OTP entered: $pin');
            },
          ),
          SizedBox(height: 33.h,),
          CustomAppButton(title: AppStrings.login, onPressed: () {

          },),
          SizedBox(height: 28.h,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.youCanResendOtp,
                style: Theme.of(context).textTheme.urbanistLabel15,
              ),
              SizedBox(width: 3.w,),

              Text(
                "${authProvider.otpSeconds}",
                style: Theme.of(context).textTheme.urbanistLabel15.copyWith(
                  color: primaryDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 4.w,),
              Text(
                AppStrings.seconds,
                style: Theme.of(context).textTheme.urbanistLabel15,
              ),
            ],
          ),

          SizedBox(height: 22.h,),


          CustomBounce(
            onPressed: () {

              authProvider.startOtpTimer();


            },
            child: Text(
              'Resend Code',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.urbanistLabel15.copyWith(
                color: const Color(0xFFC4C8D1),
              ),

            ),
          ),

        ],),
      ),

    );
  }
}
