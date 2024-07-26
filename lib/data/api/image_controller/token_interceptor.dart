import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  TokenInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.read(key: 'token');
    log('TokenInterception: token=$token');
    super.onRequest(options, handler);
  }
}
