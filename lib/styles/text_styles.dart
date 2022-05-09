import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static TextStyle typography({Color? color = AppColor.primary}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
}
