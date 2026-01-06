/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */


part of '../di.dart';

void _registerNetwork() {
  getIt.registerLazySingleton<Dio>(() {
    return createDio(
      baseUrl: "",
      storage: getIt<GetStorage>(),
      deviceInfo: getIt<DeviceInfoService>(),
    );
  });

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio: getIt<Dio>()));
}
