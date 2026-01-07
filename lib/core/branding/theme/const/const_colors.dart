import 'package:flutter/material.dart';

enum AppColor {
  mainBg,
  elevatedBg,
  primerMain,
  maintext,
  linkText,
  strokeBrand,
  helperSuccess,
  helperInfo,
  helperError,
  blurLayer,
  disabledText,
  secondaryText,
}

class AppColors {
  static const Map<AppColor, Color> light = {
    AppColor.mainBg: Color(0xFFF2F3F4),
    AppColor.elevatedBg: Color(0xFFFFFFFF),
    AppColor.primerMain: Color(0xFF007CFF),
    AppColor.maintext: Color(0xFF0F172A),
    AppColor.disabledText: Color(0xFF9FA8B5),
    AppColor.secondaryText: Color(0xFF717F95),
    AppColor.linkText: Color(0xFF018CFE),
    AppColor.strokeBrand: Color(0xFF018CFE),
    AppColor.helperError: Color(0xFFEF4444),
    AppColor.helperSuccess: Color(0xFF22C55E),
    AppColor.helperInfo: Color(0xFF438BFA),
    AppColor.blurLayer: Color(0xFF36E1FF),   
  };

  static const Map<AppColor, Color> dark = {
    
  };
}
