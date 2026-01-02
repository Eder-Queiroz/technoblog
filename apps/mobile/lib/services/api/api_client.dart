import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/datasources/local/auth_storage.dart';
import 'package:mobile/services/api/exceptions/bad_request_exception.dart';
import 'package:mobile/services/api/exceptions/forbidden_exception.dart';
import 'package:mobile/services/api/exceptions/internal_sever_error_exception.dart';
import 'package:mobile/services/api/exceptions/network_exception.dart';
import 'package:mobile/services/api/exceptions/not_found_exception.dart';
import 'package:mobile/services/api/exceptions/unauthorized_exception.dart';
import 'package:mobile/services/api/interceptors/auth_interceptor.dart';
import 'package:mobile/utils/core/environment.dart';

final apiClientProvider = Provider(
  (ref) => ApiClient(
    baseUrl: Environment.apiBaseUrl,
    authStorage: ref.read(authStorageProvider),
  ),
);

typedef Deserializer<T> = T Function(Map<String, dynamic> json);

class ApiClient {
  late final Dio _dio;

  ApiClient({
    required String baseUrl,
    required AuthStorage authStorage,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, String>? headers,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers:
            headers ??
            {'Content-Type': 'application/json', 'Accept': 'application/json'},
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    _dio.interceptors.add(AuthInterceptor(authStorage: authStorage));
  }

  Future<T> get<T>(
    String path, {
    required Deserializer<T> deserialize,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return deserialize(response.data!);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<T>> getList<T>(
    String path, {
    required Deserializer<T> deserialize,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return (response.data!).map<T>((e) => deserialize(e)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> post<T>(
    String path, {
    Deserializer<T>? deserialize,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return deserialize?.call(response.data!) ?? null as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> put<T>(
    String path, {
    required Deserializer<T> deserialize,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return deserialize(response.data!);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> delete<T>(
    String path, {
    required Deserializer<T> deserialize,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return deserialize(response.data!);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> patch<T>(
    String path, {
    required Deserializer<T> deserialize,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return deserialize(response.data!);
    } on DioException catch (e, stackTrace) {
      throw _handleError(e, stackTrace);
    }
  }

  Exception _handleError(DioException error, [StackTrace? stackTrace]) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException('Connection timeout', stackTrace);
      case DioExceptionType.receiveTimeout:
        return NetworkException('Receive timeout', stackTrace);
      case DioExceptionType.sendTimeout:
        return NetworkException('Send timeout', stackTrace);
      case DioExceptionType.badResponse:
        return _handleBadResponse(error, stackTrace);
      case DioExceptionType.cancel:
        return NetworkException('Request cancelled', stackTrace);
      case DioExceptionType.connectionError:
        return NetworkException(
          'Connection error: ${error.message}',
          stackTrace,
        );
      default:
        return NetworkException(
          'An unknown error: [${error.type.name}] ${error.message}',
          stackTrace,
        );
    }
  }

  Exception _handleBadResponse(DioException error, [StackTrace? stackTrace]) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    switch (statusCode) {
      case 400:
        return BadRequestException(data['message'], stackTrace);
      case 401:
        return UnauthorizedException(data['message'], stackTrace);
      case 403:
        return ForbiddenException(data['message'], stackTrace);
      case 404:
        return NotFoundException(data['message'], stackTrace);
      case 500:
        return InternalServerErrorException(data['message'], stackTrace);
      default:
        return NetworkException(
          'An unknown HTTP error: $statusCode',
          stackTrace,
        );
    }
  }
}
