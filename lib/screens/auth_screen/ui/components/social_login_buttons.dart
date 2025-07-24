import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resoures/app_colors.dart';
import '../../../../resoures/app_images.dart';

Widget socialLoginButtons({
  required BuildContext context,
  required String image
}){
  return    Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(AppImages.ellipse,height: 45.w,width: 45.w,),
      Image.asset(image,height: 24.w,width: 24.w,),

    ],
  );


}