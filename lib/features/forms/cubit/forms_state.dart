part of 'forms_cubit.dart';

@freezed
class FormsState with _$FormsState {
  const factory FormsState.initial({
    bool? isValid,
    bool? ageIsValid,
    final Email? email,
    final Password? password,
    final Age? age,
  }) = _Initial;
}
