import 'package:dio/dio.dart';
import 'package:drivado_test/src/constants/api_constants.dart';
import 'package:drivado_test/src/utils/logger.dart';

class DioService {
  static final DioService _instance = DioService._internal();

  late final Dio _dio;

  factory DioService() => _instance;

  DioService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants().baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Accept": "application/json",
        },
      ),
    );

    _dio.interceptors.addAll([
      LogInterceptor(),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //logger.d('Request: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          //logger.d('Response: ${response.statusCode}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          //logger.e('Error: ${e.message}', error: e);
          return handler.next(e);
        },
      ),
    ]);
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      logger.e('GET Error: ${e.message}');
      rethrow;
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      logger.e('POST Error: ${e.message}');
      rethrow;
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      logger.e('PUT Error: ${e.message}');
      rethrow;
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      logger.e('DELETE Error: ${e.message}');
      rethrow;
    }
  }

  Dio get dio => _dio;
}
