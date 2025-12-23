import 'package:dio/dio.dart';
import '../helper/dio_response_helper.dart';
import '../interceptors/wl_interceptor.dart';

/// Clean PostRequestHandler with helper class handling responses and exceptions
class PostRequestHandler {
  final Dio _dio;

  /// Constructor that sets up interceptors
  PostRequestHandler() : _dio = Dio(BaseOptions(baseUrl: "BaseUrl")) {
    _dio.interceptors.add(WhiteLabelInterceptor()); // Add interceptor
  }

  /// Generic POST request handler with success and error handling
  Future<Either<Map<String, dynamic>, String>> postRequest(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);

      // Use helper to check success
      if (DioResponseHelper.isSuccessStatusCode(response.statusCode)) {
        if (response.data['status'] == true || response.data['result'] != null) {
          return Either.success(Map<String, dynamic>.from(response.data['result']));
        } else {
          return Either.failure(DioResponseHelper.extractErrorMessage(response.data));
        }
      } else {
        return Either.failure(DioResponseHelper.handleStatusCode(response.statusCode, response.data));
      }
    } on DioException catch (exception) {
      return Either.failure(DioResponseHelper.handleDioException(exception));
    } catch (e) {
      return Either.failure('Unexpected error occurred: $e');
    }
  }
}

/// Wrapper class for handling Success and Failure responses
class Either<L, R> {
  final L? success; // Left is Success
  final R? failure; // Right is Failure
  final bool isSuccess;

  Either.success(this.success) : failure = null, isSuccess = true;

  Either.failure(this.failure) : success = null, isSuccess = false;
}
