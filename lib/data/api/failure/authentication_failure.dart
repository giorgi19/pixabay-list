import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/api/failure/failure.dart';

part 'authentication_failure.freezed.dart';

@freezed
class AuthenticationFailure with _$AuthenticationFailure implements Failure {
  const factory AuthenticationFailure.loginWithEmailAndPassword(
    Object error,
  ) = LoginWithEmailAndPassword;

  const factory AuthenticationFailure.registration(
    Object error,
  ) = Registration;
}
