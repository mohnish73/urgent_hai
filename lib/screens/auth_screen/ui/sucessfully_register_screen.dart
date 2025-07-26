import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
 import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

 import '../../../custom_widgets/custom_app_button.dart';
import '../../../routes/routes_name_app.dart';
import 'components/back_button.dart';


class SuccessfullyRegisterScreen extends StatefulWidget {
  const SuccessfullyRegisterScreen({super.key});

  @override
  State<SuccessfullyRegisterScreen> createState() => _SuccessfullyRegisterScreenState();
}

class _SuccessfullyRegisterScreenState extends State<SuccessfullyRegisterScreen> {
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
              AppStrings.allDoneTitle,
              style: Theme.of(context).textTheme.urbanistTitle30,
            ),
          ),
          SizedBox(height: 28.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                AppStrings.allDoneSubtitle,
                style: Theme.of(context).textTheme.urbanistLabel18,
              ),
            ),

            Image.asset(AppImages.verifiedBlueTick,height: 40.w,width: 40.w,)

          ],
        ),
          SizedBox(height: 40.h,),

          Image.asset(AppImages.allDoneImage,height: 365.w,width: 383.w,),
          SizedBox(height: 57.h,),

          CustomAppButton(title: AppStrings.letsGo, onPressed: () {

            context.pushNamed(AppRouteConstants.otpName);

          },),






        ],),
      ),

    );
  }
}
