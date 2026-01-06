import 'package:dio/dio.dart' show Dio, DioException;
import 'package:wl_platform/core/network/errors/rpc_error.dart' show RpcError;
import 'package:wl_platform/core/network/helper/api_response.dart'
    show NetworkResponse;
import 'package:wl_platform/core/network/helper/dio_response_helper.dart'
    show DioResponseHelper;

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  /// Makes RPC POST request
  Future<NetworkResponse<T>> request<T>({
    required String method,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.post(
        '',
        data: {
          'id': DateTime.now().millisecondsSinceEpoch,
          'jsonrpc': '2.0',
          'method': method,
          'params': params,
        },
      );

      return _parseResponse<T>(response.data);
    } on DioException catch (e) {
      final message = DioResponseHelper.handleDioException(e);
      return NetworkResponse.failure(
        RpcError(code: e.response?.statusCode ?? 0, message: message),
      );
    }
  }

  NetworkResponse<T> _parseResponse<T>(dynamic data) {
    if (data['error'] != null) {
      final err = data['error'];
      return NetworkResponse.failure(
        RpcError(
          code: err['code'] ?? 0,
          message: err['message'] ?? 'Unknown RPC error',
        ),
      );
    }

    return NetworkResponse.success(data['result'] as T);
  }
}
