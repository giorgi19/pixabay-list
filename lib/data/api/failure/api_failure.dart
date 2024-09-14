import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/api/failure/failure.dart';

part 'api_failure.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure implements Failure {
  const factory ApiFailure.connectionTimeout() = ConnectionTimeout;

  const factory ApiFailure.sendTimeout() = SendTimeout;

  const factory ApiFailure.receiveTimeout() = ReceiveTimeout;

  const factory ApiFailure.badCertificate() = BadCertificate;

  const factory ApiFailure.badResponse() = BadResponse;

  const factory ApiFailure.cancel() = Cancel;

  const factory ApiFailure.connectionError() = ConnectionError;

  const factory ApiFailure.other({String? message}) = Other;

  factory ApiFailure.getApiFailure(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiFailure.connectionTimeout();
      case DioExceptionType.sendTimeout:
        return const ApiFailure.sendTimeout();
      case DioExceptionType.receiveTimeout:
        return const ApiFailure.receiveTimeout();
      case DioExceptionType.badCertificate:
        return const ApiFailure.badCertificate();
      case DioExceptionType.badResponse:
        return const ApiFailure.badResponse();
      case DioExceptionType.cancel:
        return const ApiFailure.cancel();
      case DioExceptionType.connectionError:
        return const ApiFailure.connectionError();
      default:
        return ApiFailure.other(message: error.message);
    }
  }
}
