import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:urgenthai/custom_widgets/custom_app_button.dart';
import 'package:urgenthai/custom_widgets/custom_bounce.dart';
import 'package:urgenthai/resoures/app_colors.dart';
 import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';
import 'package:urgenthai/routes/routes_name_app.dart';

import '../../../custom_widgets/custom_text_form_field.dart';
import 'components/back_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Padding(
        padding:   EdgeInsets.all(20.0.w),
        child: ListView(children: [

          backButton(context:context),

           SizedBox(height: 28.h,),

          Padding(
            padding:   EdgeInsets.only(right: 71.w),
            child: Text(
              AppStrings.helloRegister,
              style: Theme.of(context).textTheme.urbanistTitle30,
            ),
          ),
          SizedBox(height: 30.h,),

          CustomTextFormField(
            hintText: AppStrings.firstName,
          ),
          SizedBox(height: 10.h,),

          CustomTextFormField(
            hintText: AppStrings.lastName,
          ),
          SizedBox(height: 10.h,),

          CustomTextFormField(
            hintText: AppStrings.dateOfBirth,
          ),
          SizedBox(height: 10.h,),

          CustomTextFormField(
            hintText: AppStrings.gender,
          ),
          SizedBox(height: 10.h,),

          CustomTextFormField(
            hintText: AppStrings.mobileNumber,
          ),
          SizedBox(height: 33.h,),
          CustomAppButton(title: AppStrings.register, onPressed: () {

            context.pushNamed(AppRouteConstants.successfullyRegisterName);

          },),
          SizedBox(height: 28.h,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.alreadyHaveAccount,
                style: Theme.of(context).textTheme.urbanistLabel15,
              ),
              SizedBox(width: 5.w,),

              CustomBounce(
                onPressed: () {
                   context.pushNamed(AppRouteConstants.loginName);
                },
                child: Text(
                  AppStrings.loginNow,
                  style: Theme.of(context).textTheme.urbanistLabel15.copyWith(
                    color: primaryDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),


        ],),
      ),

    );
  }
}
