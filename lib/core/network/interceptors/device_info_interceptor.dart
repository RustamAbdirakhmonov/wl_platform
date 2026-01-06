/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */
import 'package:dio/dio.dart';
import 'package:wl_platform/core/common/utils/device_info_service.dart'
    show DeviceInfoService;

class DeviceInfoInterceptor extends Interceptor {
  final DeviceInfoService deviceInfo;

  DeviceInfoInterceptor(this.deviceInfo);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final version = await deviceInfo.getVersionName();
      final device = await deviceInfo.getDeviceInfo();

      options.headers['Version'] = version;
      options.headers['Uuid'] = device.id;
    } catch (_) {}
    super.onRequest(options, handler);
  }
}
