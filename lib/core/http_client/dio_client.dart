import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'interceptors.dart';

const _defaultConnectTimeout = 50000;
const _defaultReceiveTimeout = 50000;

class DioClient {
  final String? baseUrl;
  Dio? dioInstance;

  final List<Interceptor>? interceptors;

  DioClient({
    this.baseUrl,
    Dio? dio,
    this.interceptors,
  }) {
    dioInstance = dio ?? Dio();
    dioInstance!
      ..options.baseUrl = baseUrl!
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if (interceptors?.isNotEmpty ?? false) {
      dioInstance!.interceptors.addAll(interceptors!);
    }

    // dioInstance?.interceptors.add(P2pInterceptors());

    if (kDebugMode) {
      dioInstance!.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
    }
  }

  String handleError(DioError error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${dioError.response!.statusCode}";
          if(dioError.response!.data != null ){
            try {
              // var apiResponse = ApiResponse.fromJson(dioError.response!.data);
              // if (apiResponse.msg != null) {
              //   errorDescription = apiResponse.msg!;
              // }
            }catch(exception){
              debugPrint(exception.toString());
            }
          }
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }

  String handleStatusCodeError(int? statusCode) {
    String errorDescription = "Something went wrong!";
    if (statusCode != null) {
      if (statusCode >= 300 && statusCode < 400) {
        errorDescription = "API redirected";
      } else if (statusCode >= 400 && statusCode < 500) {
        errorDescription = "UnAuthorised!";
      } else if (statusCode >= 500) {
        errorDescription = "Internal Server Error!";
      }
    }
    return errorDescription;
  }
}
