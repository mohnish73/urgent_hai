import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

 import '../../resoures/app_colors.dart';
import 'custom_bounce.dart';


class CustomAppButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? buttonWidth;
  final double? borderRadius;
  final double? buttonHeight;
  final double? textHeight;


  const CustomAppButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.color,
      this.textColor,
      this.buttonHeight,
      this.textHeight,
      this.buttonWidth, this.borderRadius, this.borderColor})
      : super(key: key);

  @override
  State<CustomAppButton> createState() => _CustomAppButtonState();
}


class _CustomAppButtonState extends State<CustomAppButton> {
  @override
  Widget build(BuildContext context) {
    return CustomBounce(
      onPressed: widget.onPressed,
      child: Container(
        height:widget.buttonHeight ?? 50.h,
        width: widget.buttonWidth ?? MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: ShapeDecoration(
           color: widget.color ??primaryDark ,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.0000000001,

            ),
            borderRadius: BorderRadius.circular(widget.borderRadius??35.r),
          ),
        ),
        child: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
             style: Theme.of(context).textTheme.urbanistItalicBoldWhite18.copyWith(
              fontStyle: FontStyle.normal,
               color: widget.textColor??backgroundWhite
            )
          ),
        ),
      ),
    );
  }
}
