import 'package:flutter/material.dart';

enum AppColor {
  // Backgrounds
  mainBg,
  elevatedBg,
  inverseBg,
  subtleBg,
  mutedBg,

  // Brand
  brandGreen,
  brandOrange,

  // Text
  mainText,
  secondaryText,
  disabledText,
  linkText,
  brandText,

  // Borders
  borderDefault,
  borderStrong,
  borderFocus,

  // Actions
  primary,
  primaryHover,
  primaryPressed,
  secondary,

  // State
  successBg,
  successText,
  warningBg,
  warningText,
  errorBg,
  errorText,
  infoBg,
  infoText,

  // System
  blurLayer,
  shadow,
}

class AppColors {
  static const Map<AppColor, Color> light = {
    // Backgrounds
    AppColor.mainBg: Color(0xFFF0F0F0),          // bg-default
    AppColor.subtleBg: Color(0xFFFDE8E9),       // bg-subtle
    AppColor.elevatedBg: Color(0xFFFFFFFF),     // bg-elevated
    AppColor.inverseBg: Color(0xFF06080D),      // bg-inverse
    AppColor.mutedBg: Color(0xFFE5E7EB),        // bg-muted-neutral

    // Brand
    AppColor.brandGreen: Color(0xFF024C2D),
    AppColor.brandOrange: Color(0xFFDDA046),

    // Text
    AppColor.mainText: Color(0xFF13120D),       // text-default
    AppColor.secondaryText: Color(0xFF6B7280),  // text-muted
    AppColor.disabledText: Color(0xFF9CA3AF),   // text-placeholder
    AppColor.linkText: Color(0xFF2563EB),       // info-text
    AppColor.brandText: Color(0xFFD2222D),      // text-brand

    // Borders
    AppColor.borderDefault: Color(0xFFE5E7EB),
    AppColor.borderStrong: Color(0xFFD2222D),
    AppColor.borderFocus: Color(0xFF2254D2),

    // Actions
    AppColor.primary: Color(0xFFD2222D),
    AppColor.primaryHover: Color(0xFFB01D25),
    AppColor.primaryPressed: Color(0xFF8E171E),
    AppColor.secondary: Color(0xFF262D38),

    // State
    AppColor.successBg: Color(0xFFECFDF5),
    AppColor.successText: Color(0xFF16A34A),
    AppColor.warningBg: Color(0xFFFFFBEB),
    AppColor.warningText: Color(0xFFEAB308),
    AppColor.errorBg: Color(0xFFFEF2F2),
    AppColor.errorText: Color(0xFFD2222D),
    AppColor.infoBg: Color(0xFFEFF6FF),
    AppColor.infoText: Color(0xFF2563EB),

    // System
    AppColor.blurLayer: Color(0x40000000),
    AppColor.shadow: Color(0xFFD1D5DB),
  };

  static const Map<AppColor, Color> dark = {
    // Backgrounds
    AppColor.mainBg: Color(0xFF06080D),        // bg-default (dark)
    AppColor.subtleBg: Color(0xFF1F2937),     // bg-subtle
    AppColor.elevatedBg: Color(0xFF11171F),   // bg-elevated
    AppColor.inverseBg: Color(0xFFFFFFFF),   // bg-inverse
    AppColor.mutedBg: Color(0xFF374151),      // bg-muted-neutral

    // Brand
    AppColor.brandGreen: Color(0xFF22C55E),   // lighter green for dark
    AppColor.brandOrange: Color(0xFFFBBF24),  // lighter orange

    // Text
    AppColor.mainText: Color(0xFFF9FAFB),     // text-default
    AppColor.secondaryText: Color(0xFF9CA3AF),// text-muted
    AppColor.disabledText: Color(0xFF6B7280), // text-placeholder
    AppColor.linkText: Color(0xFF60A5FA),     // info-text
    AppColor.brandText: Color(0xFFF87171),    // text-brand

    // Borders
    AppColor.borderDefault: Color(0xFF374151),
    AppColor.borderStrong: Color(0xFFF87171),
    AppColor.borderFocus: Color(0xFF60A5FA),

    // Actions
    AppColor.primary: Color(0xFFF87171),
    AppColor.primaryHover: Color(0xFFFCA5A5),
    AppColor.primaryPressed: Color(0xFFEF4444),
    AppColor.secondary: Color(0xFF9CA3AF),

    // State
    AppColor.successBg: Color(0xFF064E3B),
    AppColor.successText: Color(0xFF34D399),
    AppColor.warningBg: Color(0xFF78350F),
    AppColor.warningText: Color(0xFFFACC15),
    AppColor.errorBg: Color(0xFF7F1D1D),
    AppColor.errorText: Color(0xFFF87171),
    AppColor.infoBg: Color(0xFF1E3A8A),
    AppColor.infoText: Color(0xFF60A5FA),

    // System
    AppColor.blurLayer: Color(0x99000000),
    AppColor.shadow: Color(0xFF000000),
  };
}

