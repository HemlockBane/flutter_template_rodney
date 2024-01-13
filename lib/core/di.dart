// Network
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  final baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
  );

  void logger(Object data) {}

  final interceptors = [
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: logger,
    ),
  ];

  final configuredDio = Dio(baseOptions)..interceptors.addAll(interceptors);
  return configuredDio;
});
