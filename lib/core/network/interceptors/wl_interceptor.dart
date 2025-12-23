import 'dart:developer';

import 'package:dio/dio.dart';

class WhiteLabelInterceptor extends Interceptor {


  WhiteLabelInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the API key to the headers
    options.headers['Authorization'] = 'Bearer ${"token"}';


    // Log the request for debugging (optional)
    log('[DIO] Request to: ${options.uri}');
    log('[DIO] Request Headers: ${options.headers}');
    log('[DIO] Request Data: ${options.data}');

    handler.next(options); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the response for debugging (optional)
    log('[DIO] Response from: ${response.requestOptions.uri}');
    log('[DIO] Response Data: ${response.data}');

    handler.next(response); // Continue with the response
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Handle error responses, e.g., unauthenticated or network issues
    log('[DIO] Error: ${err.message}');
    log('[DIO] Error Data: ${err.response?.data}');

    // Retry logic or pass error along
    handler.next(err);
  }
}