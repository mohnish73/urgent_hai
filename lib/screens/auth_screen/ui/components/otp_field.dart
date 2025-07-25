import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/resoures/app_text_theme.dart';

class CustomOtpInput extends StatelessWidget {
  final void Function(String)? onCompleted;

  const CustomOtpInput({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.w,
      textStyle: Theme.of(context).textTheme.urbanistTitle30,
      decoration: BoxDecoration(
        color: textFieldFilledColor, // light grayish white
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFE8ECF4)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: primaryLight, // light green background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryDark, width: 1.5),
      ),
    );

    final submittedPinTheme = focusedPinTheme;

    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      onCompleted: onCompleted,
    );
  }
}
