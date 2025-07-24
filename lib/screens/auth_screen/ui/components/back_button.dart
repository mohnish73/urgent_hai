import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resoures/app_colors.dart';

Widget backButton({required BuildContext context}){
  return    Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
          height: 41.w,
          width: 41.w,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFE8ECF4),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Icon(Icons.arrow_back_ios_new,color: textBlack,
            size: 20.w,
          )),
    ],
  );


}