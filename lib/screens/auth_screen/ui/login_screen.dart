import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:urgenthai/custom_widgets/custom_app_button.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';
import 'package:urgenthai/routes/routes_name_app.dart';

import '../../../custom_widgets/custom_text_form_field.dart';
import 'components/back_button.dart';
import 'components/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Padding(
        padding:   EdgeInsets.all(20.0.w),
        child: ListView(children: [

          backButton(context:context),
          
          Image.asset(AppImages.prathamGreenIcon,height: 64.w,width: 64.w,),
          SizedBox(height: 28.h,),

        Padding(
          padding:   EdgeInsets.only(right: 71.w),
          child: Text(
            AppStrings.welcomeBack,
            style: Theme.of(context).textTheme.urbanistTitle30,
          ),
        ),
          SizedBox(height: 30.h,),
          CustomTextFormField(
            keyBoardType: TextInputType.phone,
            prefixIcon: IconButton(onPressed: () {

            },
              icon: Padding(
                padding: EdgeInsets.only(left: 20.0.w),
                child: Image.asset(
                  AppImages.flag, height: 32.w, fit: BoxFit.fill,),
              ),),


            hintText: AppStrings.enterMobile,
          ),
          SizedBox(height: 33.h,),
          CustomAppButton(title: AppStrings.continueText, onPressed: () {

            context.pushNamed(AppRouteConstants.otpName);

          },),
          SizedBox(height: 28.h,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.dontHaveAccount,
                style: Theme.of(context).textTheme.urbanistLabel15,
              ),
              SizedBox(width: 5.w,),

              Text(
                AppStrings.registerNow,
                style: Theme.of(context).textTheme.urbanistLabel15.copyWith(
                  color: primaryDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 22.h,),
          Row(
            children: [
              Expanded(
                child: Container(width: double.infinity,height: 1,
                color: dividerColor,),
              ),
              SizedBox(width: 20.w,),

              Text(
                AppStrings.or,
                style: Theme.of(context).textTheme.urbanistLabel18.copyWith(
                  color: textBlack,

                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 20.w,),

              Expanded(
                child: Container(width: double.infinity,height: 1,
                  color: dividerColor,),
              ),
            ],
          ),
          SizedBox(height: 35.h,),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            socialLoginButtons(context: context,image: AppImages.google),
            socialLoginButtons(context: context,image: AppImages.facebook),
            socialLoginButtons(context: context,image: AppImages.apple_logo),

          ],),

        ],),
      ),
      bottomNavigationBar:   Padding(
        padding:   EdgeInsets.all(24.0.w),
        child: Text(
          AppStrings.byContinue,
          style: Theme.of(context).textTheme.urbanistLabel15,
        ),
      ),
    );
  }
}
