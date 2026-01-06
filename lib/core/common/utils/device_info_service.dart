/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */

import 'dart:io' show Platform;

import 'package:appmetrica_plugin/appmetrica_plugin.dart' show AppMetrica;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:flutter/services.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart' show MobileDeviceIdentifier;
import 'package:uuid/uuid.dart' show Uuid;


class DeviceInfoService {
  static String? publicIp;
  IosDeviceInfo? iosInfo;

  DeviceInfo? deviceInfo;

  final MethodChannel _channel = MethodChannel('wl_channel');

  Future<DeviceInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final info = await deviceInfoPlugin.androidInfo;

      deviceInfo = DeviceInfo(
        platform: "ANDROID",
        name: info.name,
        model: info.model,
        id: info.id,
        isPhysicalDevice: info.isPhysicalDevice,
      );
      return deviceInfo!;
    } else {
      String? uuid = await AppMetrica.deviceId;
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;

      final mobileDeviceIdentifier =
      await MobileDeviceIdentifier().getDeviceId();
      debugPrint("$mobileDeviceIdentifier");
      deviceInfo = DeviceInfo(
        platform: "IOS",
        name: iosDeviceInfo.modelName,
        model: iosDeviceInfo.model,
        id: mobileDeviceIdentifier ?? uuid ?? Uuid().v4(),
        isPhysicalDevice: iosDeviceInfo.isPhysicalDevice,
      );
      return deviceInfo!;
    }
  }

  /// result => 1125
  Future<int> getVersionCode() async {
    final versionCode = await _channel.invokeMethod("getVersionCode");

    final result = int.tryParse("$versionCode") ?? 0;

    return result;
  }

  /// result => "1.0.1"
  Future<String> getVersionName() async {
    final version = await _channel.invokeMethod<String>('getVersionName');
    return version ?? 'Unknown';
  }

}

class DeviceInfo {
  final String platform;
  final String name;
  final String model;
  final String id;
  final bool isPhysicalDevice;

  DeviceInfo({
    required this.platform,
    required this.name,
    required this.model,
    required this.id,
    required this.isPhysicalDevice,
  });

  /// Factory constructor to create DeviceInfo from a Map
  factory DeviceInfo.fromMap(Map<String, dynamic> map) {
    return DeviceInfo(
      platform: map['platform'] ?? '',
      name: map['name'] ?? '',
      model: map['model'] ?? '',
      id: map['id'] ?? '',
      isPhysicalDevice: map['isPhysicalDevice'] ?? false,
    );
  }

  /// Convert DeviceInfo to Map
  Map<String, dynamic> toMap() {
    return {
      'platform': platform,
      'name': name,
      'model': model,
      'id': id,
      'isPhysicalDevice': isPhysicalDevice,
    };
  }
}