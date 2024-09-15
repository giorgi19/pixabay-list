part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    AppStatus? status,
  }) = _Initial;
}
