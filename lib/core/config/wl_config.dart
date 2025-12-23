// import 'package:flutter/material.dart';
// import 'package:isar_community/isar.dart';
//
// part 'whitelabel_config.g.dart';
// // Required for code generation
//
// @collection
// class WhiteLabelConfig {
//   Id id = Isar.autoIncrement; // Isar generates automatic IDs for objects
//
//   @Index(unique: true)
//   late String appKey; // The primary key to identify which app this config belongs to
//
//   late String appName;
//   String? apiEndpoint;
//   String? logoPath;
//
//   // Theme Configuration
//   late int primaryColor;       // Store Color as int
//   late int secondaryColor;
//   late int backgroundColor;
//
//   late double borderRadius;
//   late double cardElevation;
//
//   // Optional URLs
//   String? termsUrl;
//   String? privacyPolicyUrl;
//
//   /// Convert raw data from the backend to a WhiteLabelConfig
//   WhiteLabelConfig({
//     required this.appKey,
//     required this.appName,
//     this.apiEndpoint,
//     this.logoPath,
//     required Color primaryColor,
//     required Color secondaryColor,
//     required Color backgroundColor,
//     required this.borderRadius,
//     required this.cardElevation,
//     this.termsUrl,
//     this.privacyPolicyUrl,
//   })  : primaryColor = primaryColor.value,
//         secondaryColor = secondaryColor.value,
//         backgroundColor = backgroundColor.value;
//
//   /// Parse backend data into a `WhiteLabelConfig` object
//   static WhiteLabelConfig fromBackendData(String appKey, Map<String, dynamic> data) {
//     return WhiteLabelConfig(
//       appKey: appKey,
//       appName: data['app_name'] ?? '',
//       apiEndpoint: data['api_endpoint'],
//       logoPath: data['logo_path'],
//       primaryColor: _parseColor(data['primary_color']) ?? Colors.blue,
//       secondaryColor: _parseColor(data['secondary_color']) ?? Colors.orange,
//       backgroundColor: _parseColor(data['background_color']) ?? Colors.white,
//       borderRadius: (data['border_radius'] ?? 8.0).toDouble(),
//       cardElevation: (data['card_elevation'] ?? 4.0).toDouble(),
//       termsUrl: data['terms_url'],
//       privacyPolicyUrl: data['privacy_policy_url'],
//     );
//   }
//
//   /// Convert the Isar `int` color back to a Flutter `Color`
//   Color getPrimaryColor() => Color(primaryColor);
//   Color getSecondaryColor() => Color(secondaryColor);
//   Color getBackgroundColor() => Color(backgroundColor);
//
//   /// Helper to parse color strings like `#FFFFFF`
//   static Color? _parseColor(String? colorString) {
//     if (colorString == null || colorString.isEmpty) return null;
//     try {
//       return Color(int.parse(colorString.replaceFirst('#', '0xff')));
//     } catch (_) {
//       return null;
//     }
//   }
// }