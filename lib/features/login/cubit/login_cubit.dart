import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/repository/i_authentication_repository.dart';
import 'package:pixabay_list/utils/enum.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authenticationRepository})
      : super(const LoginState.initial(status: AppStatus.initial));

  IAuthenticationRepository authenticationRepository;

  Future<void> loginWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    emit(state.copyWith(status: AppStatus.loading));
    final loginWithEmailAndPassword =
        await authenticationRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    loginWithEmailAndPassword.fold(
      (failure) => emit(state.copyWith(status: AppStatus.failure)),
      (data) => emit(state.copyWith(status: AppStatus.success)),
    );
  }
}
