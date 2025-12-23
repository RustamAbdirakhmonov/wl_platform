import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

class DioResponseHelper {
  static bool isSuccessStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  /// Main: HTTP status -> localized friendly text
  static String handleStatusCode(int? statusCode, dynamic responseData) {
    final details = _detailsSuffix(extractErrorMessage(responseData));

    switch (statusCode) {
      case 400:
        return 'dio_helper.http.400'.tr(namedArgs: {'details': details});
      case 401:
        return 'dio_helper.http.401'.tr();
      case 403:
        return 'dio_helper.http.403'.tr();
      case 404:
        return 'dio_helper.http.404'.tr();
      case 409:
        return 'dio_helper.http.409'.tr(namedArgs: {'details': details});
      case 422:
        return 'dio_helper.http.422'.tr(namedArgs: {'details': details});
      case 429:
        return 'dio_helper.http.429'.tr();
      case 500:
        return 'dio_helper.http.500'.tr();
      case 503:
        return 'dio_helper.http.503'.tr();
      default:
        return 'dio_helper.http.other'.tr(
          namedArgs: {
            'code': statusCode?.toString() ?? '-',
            'details': details,
          },
        );
    }
  }

  /// Response body -> best-effort human text (for {details})
  static String? extractErrorMessage(dynamic responseData) {
    try {
      if (responseData == null) return null;

      if (responseData is String) {
        final s = responseData.trim();
        return s.isEmpty ? null : s;
      }

      if (responseData is Map) {
        // common keys
        final candidates = ['message', 'detail', 'error', 'description', 'msg'];
        for (final k in candidates) {
          final v = responseData[k];
          if (v is String && v.trim().isNotEmpty) return v.trim();
        }

        // nested validation errors: { errors: { field: ["text"] } } OR { errors: ["text"] }
        final errors = responseData['errors'];
        if (errors is Map && errors.isNotEmpty) {
          final firstKey = errors.keys.first;
          final v = errors[firstKey];
          if (v is List && v.isNotEmpty) return v.first.toString();
          if (v != null) return v.toString();
        }
        if (errors is List && errors.isNotEmpty) return errors.first.toString();
      }
    } catch (_) {}
    return null;
  }

  /// DioException -> localized friendly text
  static String handleDioException(DioException exception) {
    // Extra: real no-internet detection
    final err = exception.error;
    if (err is SocketException) {
      return 'dio_helper.net.no_internet'.tr();
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return 'dio_helper.net.connection_timeout'.tr();

      case DioExceptionType.sendTimeout:
        return 'dio_helper.net.send_timeout'.tr();

      case DioExceptionType.receiveTimeout:
        return 'dio_helper.net.receive_timeout'.tr();

      case DioExceptionType.badResponse:
        return handleStatusCode(exception.response?.statusCode, exception.response?.data);

      case DioExceptionType.cancel:
        return 'dio_helper.net.cancelled'.tr();

      case DioExceptionType.connectionError:
        return 'dio_helper.net.connection_error'.tr();

      case DioExceptionType.unknown:
      // show technical message only in debug
        if (kDebugMode && (exception.message?.isNotEmpty ?? false)) {
          return 'dio_helper.net.unknown_debug'
              .tr(namedArgs: {'details': exception.message ?? ''});
        }
        return 'dio_helper.net.unknown'.tr();

      default:
        if (kDebugMode && (exception.message?.isNotEmpty ?? false)) {
          return 'dio_helper.net.unhandled_debug'
              .tr(namedArgs: {'details': exception.message ?? ''});
        }
        return 'dio_helper.net.unhandled'.tr();
    }
  }

  static String _detailsSuffix(String? msg) {
    final m = (msg ?? '').trim();
    return m.isEmpty ? '' : ': $m';
  }
}
