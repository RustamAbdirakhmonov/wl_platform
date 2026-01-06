/* January 2026 , Baxrom Rajabov, Tashkent , Uzbekistan */

import 'package:wl_platform/core/network/errors/rpc_error.dart';

/// Wraps either a successful RPC result or an RPC/Network error
class NetworkResponse<T> {
  final T? result;
  final RpcError? error;

  const NetworkResponse._({this.result, this.error});

  factory NetworkResponse.success(T result) =>
      NetworkResponse._(result: result);

  factory NetworkResponse.failure(RpcError error) =>
      NetworkResponse._(error: error);

  bool get isSuccess => error == null;
  bool get isFailure => error != null;
}

