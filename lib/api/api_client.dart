import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<Dio>((ref) {
  throw Exception('未実装');
});

Dio createDioInstance({
  required String baseUrl,
}) {
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 1),
    sendTimeout: const Duration(seconds: 1),
    receiveTimeout: const Duration(seconds: 1),
  );

  return Dio(options);
}
