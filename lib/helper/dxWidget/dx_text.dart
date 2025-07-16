import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../app_utilities/app_theme.dart';

import '../app_utilities/size_reziser.dart';

class DxTextWhite extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;

  DxTextWhite(this.mTitle, {this.mBold = false, this.mSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      style:
          AppStyles.getTextStyleWhite(this.mBold, getSize(this.mSize, context)),
    );
  }
}

class DxTextBlack extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;
  TextAlign? textAlign;
  FontWeight fontWeight;
  TextOverflow overflow;
  int? maxLine;

  DxTextBlack(this.mTitle,
      {this.textAlign,
      this.maxLine = 1,
      this.overflow = TextOverflow.ellipsis,
      this.mBold = false,
      this.mSize = 16,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      overflow: overflow,
      maxLines: maxLine,
      style: this.mBold
          ? AppStyles.getTextStyle(this.mBold, getSize(this.mSize, context),
              fontWeight: this.fontWeight)
          : AppStyles.getTextStyle(this.mBold, getSize(this.mSize, context)),
      textAlign: textAlign,
    );
  }
}



class DxText extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;
  Color textColor;
  TextAlign? textAlign;
  int maxLines;
  TextOverflow overflow;
  bool lineThrough;

  DxText(this.mTitle,
      {this.mBold = false,
      this.maxLines = 1,
      this.textAlign,
      this.mSize = 16,
      this.lineThrough = false,
      this.overflow = TextOverflow.ellipsis,
      this.textColor = Colors.black,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return lineThrough
        ? Text(
            this.mTitle,
            style: AppStyles.getTextStrikeThrough(
              this.mBold,
              getSize(this.mSize, context),
              textColor: textColor,
            ),
            overflow: overflow,
            textAlign: textAlign,
            maxLines: maxLines,
          )
        : Text(
            this.mTitle,
            style: AppStyles.getTextStyle(
                this.mBold, getSize(this.mSize, context),
                color: textColor),
            overflow: overflow,
            textAlign: textAlign,
            maxLines: maxLines,
          );
  }
}



class DxTextPrimary extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;
  TextAlign textAlign;
  int maxLines;

  DxTextPrimary(
    this.mTitle, {
    this.mBold = false,
    this.mSize = 16,
    this.textAlign = TextAlign.left,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      style: AppStyles.getTextStylePrimary(
          this.mBold, getSize(this.mSize, context)),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}



class AppStyles {
  AppStyles._();

  static TextStyle getTextStyle(bool isSemiBold, double fontSize,
      {FontWeight fontWeight = FontWeight.w400,
        Color color = Colors.black}) =>
      new TextStyle(
        // fontFamily: AppFonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w500 : fontWeight,
          color: color,
          fontSize: fontSize,
          fontFamily:
          isSemiBold ? AppFonts.textSemiBold : AppFonts.textRegular);

  static TextStyle getTextStrikeThrough(bool isSemiBold, double fontSize,
      {Color textColor = Colors.black}) =>
      TextStyle(
          fontFamily: isSemiBold ? AppFonts.textSemiBold : AppFonts.textRegular,
          color: textColor,
          fontWeight: isSemiBold ? FontWeight.w500 : FontWeight.w400,
          fontSize: fontSize,
          decoration: TextDecoration.lineThrough);

  static TextStyle getTextStyleColor(bool isSemiBold, double fontSize,
      {Color textColor = Colors.black,
        FontWeight fontWeight = FontWeight.w400}) =>
      new TextStyle(
        // fontFamily: AppFonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w500 : fontWeight,
          color: textColor,
          fontSize: fontSize);

  static TextStyle getTextStylePrimary(bool isSemiBold, double fontSize) =>
      new TextStyle(
          fontFamily: AppFonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w500 : FontWeight.w400,
          color: materialPrimaryColor,
          fontSize: fontSize);

  static TextStyle getTextStyleGreen(bool isSemiBold, double fontSize) =>
      new TextStyle(
          fontFamily: AppFonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
          color: Colors.green,
          fontSize: fontSize);

  static TextStyle getTextStyleRed(bool isSemiBold, double fontSize) =>
      new TextStyle(
          fontFamily: AppFonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
          color: Colors.redAccent,
          fontSize: fontSize);

  static TextStyle getTextStyleWhite(bool isSemiBold, double fontSize) =>
      new TextStyle(
          fontFamily: AppFonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
          color: Colors.white,
          fontSize: fontSize);

  static TextStyle getTextStyleDefaultColor(bool isSemiBold, double fontSize) =>
      new TextStyle(
        // fontFamily: App/Fonts.textRegular,
          fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
          fontSize: fontSize);
}
