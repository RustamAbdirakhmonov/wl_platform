/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */

import 'env.dart' show AppEnv;

class DevEnv implements AppEnv {
  @override
  String get baseUrl => 'https://dev.api.example.com';
}