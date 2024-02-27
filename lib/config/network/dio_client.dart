import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../utils/helper/helper.dart';
import 'base_response.dart';
import 'error_handler.dart';

class DioClient {
  late Dio dio;
  static final DioClient instance = DioClient._internal();
  factory DioClient() {
    return instance;
  }

  DioClient._internal() {
    String baseUrl = "Environment.getApiBaseUrl()";
    String appVersion = '';
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl + appVersion,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);

    String key = 'XXXXX'; // root certificate content
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return cert.pem == key; // Verify the certificate.
        };
        return client;
      },
    );

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      log("app response data ${response.data}");

      return handler.next(response);
    }, onError: (DioException e, handler) {
      log("app error data $e");

      ErrorEntity eInfo = createErrorEntity(e);
      onError(eInfo);
    }));
  }
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = PrefHelper.instance.token;
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future<BaseResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    var baseResponse =
        BaseResponse(statusCode: response.statusCode, body: response.data);
    return baseResponse;
  }

  Future<BaseResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    var baseResponse =
        BaseResponse(statusCode: response.statusCode, body: response.data);
    return baseResponse;
  }

  Future<BaseResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.put(path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken);
    var baseResponse =
        BaseResponse(statusCode: response.statusCode, body: response.data);
    return baseResponse;
  }

  Future<BaseResponse> pacth(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.patch(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    var baseResponse =
        BaseResponse(statusCode: response.statusCode, body: response.data);
    return baseResponse;
  }

  Future<BaseResponse> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.delete(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    var baseResponse =
        BaseResponse(statusCode: response.statusCode, body: response.data);
    return baseResponse;
  }
}
