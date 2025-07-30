import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

import '../resoures/app_images.dart';

Widget addressWidget({
  required BuildContext context,
  required String  title,
  required String  subTitle,
  required String  icon,

}){
  return Container(

    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 3,
          offset: Offset(0, 1),
          spreadRadius: 1,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Image.asset(icon,height: 32.h,width: 32.w,),

        SizedBox(width: 22.w,),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manali 43A',
                style: Theme.of(context).textTheme.urbanistTitle16,

              ),

              SizedBox(height: 6.h,),

              Text('PLot no, 12, Phase IV, Udyog Vihar, Sector 18, Gurugram, Haryana 122015',
                style: Theme.of(context).textTheme.urbanistParagraph14,

              )
            ],),
        )
      ],),
    ),
  );
}