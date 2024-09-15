import 'package:dio/dio.dart';
import 'package:pixabay_list/data/api/failure/api_failure.dart';
import 'package:pixabay_list/data/api/failure/authentication_failure.dart';

class AuthenticationDataSource {
  /// Commented out because of a mocked response
  // final ApiClient _apiClient = locator<ApiClient>();

  Future<String?> loginWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    try {
      /// Commented out because of a mocked response
      // final response = await _apiClient.httpClient.get('');
      // if (response.statusCode == HttpStatus.ok) {
      //   return response;
      // }

      /// Mocked response
      return '';
    } on DioException catch (error, stackTrace) {
      throw Error.throwWithStackTrace(
        ApiFailure.getApiFailure(error),
        stackTrace,
      );
    } catch (error, stackTrace) {
      throw Error.throwWithStackTrace(
        AuthenticationFailure.loginWithEmailAndPassword(error),
        stackTrace,
      );
    }
  }

  Future<String?> registration({
    String? email,
    String? password,
    int? age,
  }) async {
    try {
      /// Commented out because of a mocked response
      // final response = await _apiClient.httpClient.get('');
      // if (response.statusCode == HttpStatus.ok) {
      //   return response;
      // }

      /// Mocked response
      return '';
    } on DioException catch (error, stackTrace) {
      throw Error.throwWithStackTrace(
        ApiFailure.getApiFailure(error),
        stackTrace,
      );
    } catch (error, stackTrace) {
      throw Error.throwWithStackTrace(
        AuthenticationFailure.registration(error),
        stackTrace,
      );
    }
  }
}
