import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pixabay_list/data/api/failure/api_failure.dart';
import 'package:pixabay_list/data/api/failure/authentication_failure.dart';
import 'package:pixabay_list/data/api/failure/general_failure.dart';
import 'package:pixabay_list/data/api/repo_response.dart';
import 'package:pixabay_list/data/data_sources/remote/authentication_data_source.dart';

abstract class IAuthenticationRepository {
  RepoResponse<String?> loginWithEmailAndPassword({
    String? email,
    String? password,
  });
}

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({required this.authenticationDataSource});

  final AuthenticationDataSource authenticationDataSource;

  @override
  RepoResponse<String?> loginWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    try {
      final result = await authenticationDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(result);
    } on DioException catch (error) {
      return left(ApiFailure.getApiFailure(error));
    } on AuthenticationFailure catch (error) {
      return left(
        AuthenticationFailure.loginWithEmailAndPassword(error.toString()),
      );
    } catch (error) {
      return left(GeneralFailure.unknown(error.toString()));
    }
  }
}
