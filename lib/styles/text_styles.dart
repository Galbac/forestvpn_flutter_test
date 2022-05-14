import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static TextStyle typography20({Color? color = AppColor.primary}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
  static TextStyle typography28({Color? color = AppColor.secondary}) {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
}
