import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pixabay_list/utils/email.dart';
import 'package:pixabay_list/utils/enum.dart';
import 'package:pixabay_list/utils/password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(status: AppStatus.initial));

  void emailChanged({required String emailString}) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        isValid:
            Formz.validate([email, state.password ?? const Password.pure()]),
      ),
    );
  }

  void passwordChanged({required String passwordString}) {
    final password = Password.dirty(passwordString);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email ?? const Email.pure(), password]),
      ),
    );
  }
}
