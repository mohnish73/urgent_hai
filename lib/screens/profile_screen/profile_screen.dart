import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_strings.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:   EdgeInsets.all(35.0.w),
        child: Column(children: [
          SizedBox(height: 50.h,),
          Image.asset(AppImages.demoProfile,width: 94.w,height: 94.w,),
          SizedBox(height: 17.h,),


          Text(
            'Pratham',
            style: Theme.of(context).textTheme.urbanistTitle16,

          ),



          Text('prtham123@gmail.com',
            style: Theme.of(context).textTheme.urbanistParagraph14.copyWith(color: textGray),

          ),

          SizedBox(height: 71.h,),

          rowSection(context: context,
              icon: AppImages.aboutMe,
              arrowShow: true,

              title: AppStrings.aboutMe),

          SizedBox(height: 25.h,),
          rowSection(context: context,
              icon: AppImages.historyIcon,
              arrowShow: true,

              title: AppStrings.history),
          SizedBox(height: 25.h,),


          rowSection(context: context,
              icon: AppImages.notificationIcon,
              arrowShow: true,

              title: AppStrings.notifications),
          SizedBox(height: 25.h,),

          rowSection(context: context,
              icon: AppImages.signOutIcon,
              arrowShow: false,
              title: AppStrings.signOut),






        ],),
      ),
    );
  }


  Widget rowSection({
    required BuildContext context,
    required String icon,
    required String title,
      bool ? arrowShow,


}){

    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(children: [
          Image.asset(icon,width: 20.w,height: 20.w,),
          SizedBox(width: 10.w,),
          Text(
            title,
            style: Theme.of(context).textTheme.urbanistTitle16.copyWith(fontSize: 13.sp,
              letterSpacing: 0.36,
            ),
          ),

        ],),
arrowShow==true?
        Image.asset(AppImages.arrowForward,width: 11.w,height: 18.h,):SizedBox(),
      ],);
  }
}


