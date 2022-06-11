import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static TextStyle m20({Color? color = AppColor.primary}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
  static TextStyle m28({Color? color = AppColor.secondary}) {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
  static TextStyle m16({Color? color = AppColor.primary}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
  static TextStyle r12({Color? color = AppColor.thirdary}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
      // fontFamily: 'SFProDisplay',
    );
  }
  static TextStyle r18({Color? color = AppColor.primary}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: 'SFProDisplay',
    );
  }
}
