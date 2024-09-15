import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/utils/age.dart';
import 'package:pixabay_list/utils/email.dart';
import 'package:pixabay_list/utils/password.dart';

part 'forms_cubit.freezed.dart';
part 'forms_state.dart';

class FormsCubit extends Cubit<FormsState> {
  FormsCubit() : super(const FormsState.initial());

  void emailChanged({required String emailString}) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password ?? const Password.pure(),
        ]),
      ),
    );
  }

  void passwordChanged({required String passwordString}) {
    final password = Password.dirty(passwordString);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.email ?? const Email.pure(),
          password,
        ]),
      ),
    );
  }

  void ageChanged({required String ageString}) {
    final age = Age.dirty(ageString);
    emit(
      state.copyWith(
        age: age,
        ageIsValid: Formz.validate([
          age,
        ]),
      ),
    );
  }
}
