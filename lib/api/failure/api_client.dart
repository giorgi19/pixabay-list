import 'dart:io';

import 'package:dio/dio.dart';

typedef TokenProvider = Future<String?> Function();

class ApiClient {
  ApiClient({
    required this.baseUrl,
    required this.tokenProvider,
    required this.httpClient,
  }) {
    httpClient.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.value,
        HttpHeaders.acceptHeader: ContentType.json.value,
      },
    );

    httpClient.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await tokenProvider();

        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        return handler.next(e); // Pass the error
      },
    ));
  }

  final String baseUrl;
  final Dio httpClient;
  final TokenProvider tokenProvider;
}
