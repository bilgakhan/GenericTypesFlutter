import 'package:dio/dio.dart';

abstract class NetworkResponseConfig {
  NetworkResponseConfig();
}

class NetworkSuccessResponse<T> extends NetworkResponseConfig {
  T model;
  NetworkSuccessResponse(this.model);
}

class NetworkErrorResponse extends NetworkResponseConfig {
  String error = "";
  NetworkErrorResponse(this.error);
}

class NetworkExceptionResponse extends NetworkResponseConfig {
  DioException exception;
  String messageForUser = "";
  NetworkExceptionResponse(this.exception) {
    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.unknown) {
      messageForUser = "Internetingiz uzulib qoldi...";
    } else if (exception.type == DioExceptionType.cancel) {
      messageForUser = "Bekor qilindi...";
    } else if (exception.type == DioExceptionType.badResponse ||
        exception.type == DioExceptionType.badCertificate) {
      messageForUser = "Ko'zda tutilagan xatolik";
    }
  }
}
