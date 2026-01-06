/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */

import 'package:dio/dio.dart' show Dio, BaseOptions;
import 'package:get_storage/get_storage.dart' show GetStorage;
import 'package:wl_platform/core/common/utils/device_info_service.dart' show DeviceInfoService;
import 'package:wl_platform/core/network/interceptors/auth_header_interceptor.dart' show AuthHeaderInterceptor;
import 'package:wl_platform/core/network/interceptors/base_headers_interceptor.dart' show BaseHeadersInterceptor;
import 'package:wl_platform/core/network/interceptors/device_info_interceptor.dart' show DeviceInfoInterceptor;
import 'package:wl_platform/core/network/interceptors/wl_interceptor.dart';

Dio createDio({
  required String baseUrl,
  required GetStorage storage,
  required DeviceInfoService deviceInfo,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Add interceptors
  dio.interceptors.addAll([
    BaseHeadersInterceptor(),     // Content-Type, Accept
    AuthHeaderInterceptor(storage), //  Bearer token if available
    DeviceInfoInterceptor(deviceInfo), //  Version & Uuid headers
    WhiteLabelInterceptor()
  ]);

  return dio;
}
