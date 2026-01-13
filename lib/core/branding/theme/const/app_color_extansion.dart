import 'package:flutter/material.dart';
import 'package:wl_platform/core/branding/theme/const/const_colors.dart';

extension AppColorContext on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  Color _resolve(AppColor color) =>
      _isDark ? AppColors.dark[color]! : AppColors.light[color]!;

  // Backgrounds
  Color get mainBg => _resolve(AppColor.mainBg);
  Color get elevatedBg => _resolve(AppColor.elevatedBg);
  Color get inverseBg => _resolve(AppColor.inverseBg);
  Color get subtleBg => _resolve(AppColor.subtleBg);
  Color get mutedBg => _resolve(AppColor.mutedBg);

  // Brand
  Color get brandGreen => _resolve(AppColor.brandGreen);
  Color get brandOrange => _resolve(AppColor.brandOrange);

  // Text
  Color get mainText => _resolve(AppColor.mainText);
  Color get secondaryText => _resolve(AppColor.secondaryText);
  Color get disabledText => _resolve(AppColor.disabledText);
  Color get linkText => _resolve(AppColor.linkText);
  Color get brandText => _resolve(AppColor.brandText);

  // Borders
  Color get borderDefault => _resolve(AppColor.borderDefault);
  Color get borderStrong => _resolve(AppColor.borderStrong);
  Color get borderFocus => _resolve(AppColor.borderFocus);

  // Actions
  Color get primary => _resolve(AppColor.primary);
  Color get primaryHover => _resolve(AppColor.primaryHover);
  Color get primaryPressed => _resolve(AppColor.primaryPressed);
  Color get secondary => _resolve(AppColor.secondary);

  // State
  Color get successBg => _resolve(AppColor.successBg);
  Color get successText => _resolve(AppColor.successText);
  Color get warningBg => _resolve(AppColor.warningBg);
  Color get warningText => _resolve(AppColor.warningText);
  Color get errorBg => _resolve(AppColor.errorBg);
  Color get errorText => _resolve(AppColor.errorText);
  Color get infoBg => _resolve(AppColor.infoBg);
  Color get infoText => _resolve(AppColor.infoText);

  // System
  Color get blurLayer => _resolve(AppColor.blurLayer);
  Color get shadow => _resolve(AppColor.shadow);
}