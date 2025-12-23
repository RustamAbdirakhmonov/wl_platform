import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WhiteLabelAssetLoader extends AssetLoader {
  final String? appKey; // Nullable appKey

  WhiteLabelAssetLoader([this.appKey]); // appKey is optional

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    // Load common translations
    final commonTranslationPath =
        'lib/core/localization/translations/core/${locale.languageCode}.json';
    final commonTranslations = await _tryLoadFile(commonTranslationPath);
    final commonMap = json.decode(commonTranslations) as Map<String, dynamic>;

    // If appKey is null, return only common translations
    if (appKey == null) {
      print("No appKey provided. Using only core translations.");
      return commonMap;
    }

    // Load app-specific translations if appKey is provided
    final appSpecificTranslationPath =
        'lib/core/localization/translations/$appKey/${locale.languageCode}.json';
    final appSpecificTranslations = await _tryLoadFile(appSpecificTranslationPath);
    final appSpecificMap = json.decode(appSpecificTranslations) as Map<String, dynamic>;

    // Merge common and app-specific translations
    return {...commonMap, ...appSpecificMap}; // appSpecificMap overwrites commonMap
  }

  /// Try to load a file, return "{}" if the file doesn't exist
  Future<String> _tryLoadFile(String path) async {
    try {
      return await rootBundle.loadString(path);
    } catch (e) {
      print('Error loading file at $path: $e');
      return "{}"; // Return empty JSON object for missing files
    }
  }
}