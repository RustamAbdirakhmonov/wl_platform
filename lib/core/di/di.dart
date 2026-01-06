/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */

import 'package:get_it/get_it.dart' show GetIt;
import 'package:dio/dio.dart' show Dio;
import 'package:get_storage/get_storage.dart';
import 'package:wl_platform/core/common/utils/device_info_service.dart';
import 'package:wl_platform/core/network/client/api_client.dart' show ApiClient;
import 'package:wl_platform/core/network/client/dio_client.dart';

part 'modules/network_module.dart';

part 'modules/service_module.dart';

part 'modules/storage_module.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  _registerStorage();
  _registerNetwork();
}
