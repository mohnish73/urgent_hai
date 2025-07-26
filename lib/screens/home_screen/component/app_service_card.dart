import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/resoures/app_images.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

Widget appServiceCard({
  required BuildContext context,
  required String serviceName,
  required String serviceTitle,
  required String serviceImage,
  required double imageHeight,
  required double imageWidth,

}) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Container(
        width: 165.w,
        height: 160.h,
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
          padding:   EdgeInsets.only(left: 13.w,right: 5.w,top: 13.w,bottom: 5.w),
          child: Column(children: [
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(serviceName,
                  style: Theme.of(context).textTheme.urbanistTitle20,
                ),

                Text(serviceTitle,
                  style: Theme.of(context).textTheme.urbanistParagraph15.copyWith(
                    color: const Color(0xFF3E3E3E),
                  ),
                ),
              ],)

            ],),




          ],),
        ),
      ),

      Padding(
        padding:   EdgeInsets.all(8.0),
        child: Image.asset(serviceImage,height: imageHeight.h,width: imageWidth.w,fit: BoxFit.fill,),
      )

    ],
  );
}