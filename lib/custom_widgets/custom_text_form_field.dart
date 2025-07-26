import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

import '../../resoures/app_colors.dart';



class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String ? hintText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator; // Added validator parameter

  final TextInputType? keyBoardType;
  final bool? enabled;
  final bool? obscureText;
  final bool? readOnly;
  final String? validationResult;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLine;
  final double? borderRadius;

  final double? height;
  final bool  ? autofocus;

  final Color? hintColor;
  final Color? filledColor;
  final Color? borderColor;
  final double? contentHorizontalPadding;

  const CustomTextFormField({
    this.controller,
    this.hintText,
    this.onChanged,
    this.validator,
    this.onTap,
    this.onSubmitted,
    this.enabled,
    this.inputFormatters,
    this.keyBoardType,
    this.suffixIcon,
    this.maxLine,
    this.height,
    this.hintColor,
    this.obscureText,
    this.prefixIcon,
    this.borderRadius,
    this.validationResult,
    this.readOnly, this.autofocus, this.filledColor, this.borderColor, this.contentHorizontalPadding,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? _errorText;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height??56.h,
          decoration: BoxDecoration(
            color: widget.filledColor?? textFieldFilledColor,

            borderRadius: BorderRadius.circular(widget.borderRadius??8),

            // border: Border(
            //
            //     color: widget.borderColor ?? textFormFieldBorderColor,
            //     width: 0.5),


          ),
          child:
          TextFormField(
            obscuringCharacter: "*",
            controller: widget.controller,
            keyboardType: widget.keyBoardType,
            autofocus:widget.autofocus??false,
            readOnly: widget.readOnly ?? false,


            // onChanged: widget.onChanged,
            onChanged: (value) {
              setState(() {
                _errorText = widget.validator?.call(value);
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },

            // onFieldSubmitted: widget.onSubmitted,
            onFieldSubmitted: (value) {
              setState(() {
                _errorText = widget.validator?.call(value);
              });
              if (widget.onSubmitted != null) {
                widget.onSubmitted!(value);
              }
            },
            inputFormatters: widget.inputFormatters,
            onTap: widget.onTap,

            validator: widget.validator,

            enabled: widget.enabled,
            maxLines: widget.maxLine ?? 1,
            obscureText: widget.obscureText ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            decoration: InputDecoration(
              // fillColor: Color(0xFFFBFBFB),
                fillColor: widget.filledColor?? textFieldFilledColor,

                // filled: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18, // Adjust vertical padding to control height
                  horizontal: widget.contentHorizontalPadding??10.0, // Adjust horizontal padding as needed
                ),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.urbanistLabel15.copyWith(
                     color: widget.hintColor ?? textGray
                ),
                // hintStyle: TextStyle(
                //   color: widget.hintColor ?? Colors.grey,
                //   fontSize: 14.sp,
                //   fontFamily: 'Arial',
                //   fontWeight: FontWeight.w400,
                // ),
                errorStyle: TextStyle(fontSize: 0.0001),
                border: InputBorder.none,
                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(widget.borderRadius??8),
                //
                //   borderSide: BorderSide(color:widget.borderColor ??textFormFieldBorderColor,width: 0.5),
                //
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(widget.borderRadius??8),
                //
                //   borderSide: BorderSide(color: widget.borderColor ??textFormFieldBorderColor,width: 0.5),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(widget.borderRadius??8),
                //
                //   borderSide: BorderSide(color:widget.borderColor ?? textFormFieldBorderColor,width: 0.5),
                //
                // ),
                // focusedErrorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(widget.borderRadius??8),
                //
                //   borderSide: BorderSide(color:widget.borderColor ?? textFormFieldBorderColor,width: 0.5),
                // ),
                //
                // errorBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: widget.borderColor ??textFormFieldBorderColor,width: 0.5),
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(widget.borderRadius ?? 8))),


                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(widget.borderRadius??8),
                //
                //   borderSide: BorderSide(color:widget.borderColor ?? textFormFieldBorderColor,width: 0.5),
                // ),
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon),
            style: Theme.of(context).textTheme.urbanistLabel15.copyWith(
              color: widget.hintColor ?? textGray
            ),
          ),
        ),



      ],
    );


  }
}
