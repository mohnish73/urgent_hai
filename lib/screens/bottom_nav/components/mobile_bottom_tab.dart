import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

class MobileBottomTab extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;

  const MobileBottomTab({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Color iconColor = isSelected ? primaryDark: bottomGrey;
    Color textColor = isSelected ? primaryDark : bottomGrey;

    Widget imageWidget;

    if (image.endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
        image,
        height: 24.w,
        width: 24.w,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      );
    } else {
      imageWidget = Image.asset(
        image,
        height: 24.w,
        width: 24.w,
        color: iconColor,
        colorBlendMode: BlendMode.srcIn,
      );
    }

    return Container(
      padding: EdgeInsets.only(bottom: 6.h),
      width: width / 4,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          imageWidget,
          SizedBox(height: 5.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .urbanistLabel15
                .copyWith(color: textColor,fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
