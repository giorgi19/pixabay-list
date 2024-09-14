import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/api/failure/failure.dart';

part 'authentication_failure.freezed.dart';

@freezed
class AuthenticationFailure with _$AuthenticationFailure implements Failure {
  const factory AuthenticationFailure.loginWithEmailAndPassword(
    Object error,
  ) = LoginWithEmailAndPassword;
}
