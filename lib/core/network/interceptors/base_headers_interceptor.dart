/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */
import 'package:dio/dio.dart';

class BaseHeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }
}
