class RpcError {
  final int code;
  final String message;

  RpcError({
    required this.code,
    required this.message,
  });

  @override
  String toString() => 'RpcError(code: $code, message: $message)';
}