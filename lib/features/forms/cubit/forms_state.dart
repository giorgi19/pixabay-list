part of 'forms_cubit.dart';

@freezed
class FormsState with _$FormsState {
  const factory FormsState.initial({
    bool? isValid,
    final Email? email,
    final Password? password,
  }) = _Initial;
}
