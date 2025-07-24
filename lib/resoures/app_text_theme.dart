import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension UrbanistThemeTextExtension on TextTheme {
  // Title Bold (SemiBold - 15 / 20 / 25 / 30)
  TextStyle get urbanistTitle15 => _urbanistSemiBold(15.sp);
  TextStyle get urbanistTitle20 => _urbanistSemiBold(20.sp);
  TextStyle get urbanistTitle25 => _urbanistSemiBold(25.sp);
  TextStyle get urbanistTitle30 => _urbanistSemiBold(30.sp);

  // Paragraph Regular - Regular 15
  TextStyle get urbanistParagraph15 => _urbanistRegular(15.sp);

  // Paragraph Medium - Medium 10 / 12 / 15
  TextStyle get urbanistParagraph10Med => _urbanistMedium(10.sp);
  TextStyle get urbanistParagraph12Med => _urbanistMedium(12.sp);
  TextStyle get urbanistParagraph15Med => _urbanistMedium(15.sp);

  // Label - Medium 12 / 15
  TextStyle get urbanistLabel12 => _urbanistMedium(12.sp);
  TextStyle get urbanistLabel15 => _urbanistMedium(15.sp);

  // Custom Italic Bold White Text
  TextStyle get urbanistItalicBoldWhite18 => TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontStyle: FontStyle.italic,
     fontWeight: FontWeight.w700,
    height: 1.30,
    letterSpacing: -0.18,
  );
}

// 🔧 Private helpers
TextStyle _urbanistRegular(double fontSize) => TextStyle(
   fontWeight: FontWeight.w400,
  fontSize: fontSize,
  color: Colors.black,
);

TextStyle _urbanistMedium(double fontSize) => TextStyle(
   fontWeight: FontWeight.w500,
  fontSize: fontSize,
  color: Colors.black,
);

TextStyle _urbanistSemiBold(double fontSize) => TextStyle(

  fontWeight: FontWeight.w700,
  fontSize: fontSize,
  color: Colors.black,
  height: 1.30,
  letterSpacing: -0.30,
);
