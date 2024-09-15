import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_list/data/repository/i_authentication_repository.dart';
import 'package:pixabay_list/utils/enum.dart';

part 'registration_cubit.freezed.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({
    required this.authenticationRepository,
  }) : super(const RegistrationState.initial());

  IAuthenticationRepository authenticationRepository;

  Future<void> registration({
    String? email,
    String? password,
    int? age,
  }) async {
    emit(state.copyWith(status: AppStatus.loading));
    final registration = await authenticationRepository.registration(
      email: email,
      password: password,
      age: age,
    );
    registration.fold(
      (failure) => emit(state.copyWith(status: AppStatus.failure)),
      (data) => emit(state.copyWith(status: AppStatus.success)),
    );
  }
}
