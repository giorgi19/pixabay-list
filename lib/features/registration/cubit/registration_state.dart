part of 'registration_cubit.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial({
    AppStatus? status,
  }) = _Initial;
}
