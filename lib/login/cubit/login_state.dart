part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status,
    this.email,
    this.password,
    this.isValid,
  });

  final AppStatus? status;
  final Email? email;
  final Password? password;
  final bool? isValid;

  LoginState copyWith({
    AppStatus? status,
    Email? email,
    Password? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        isValid,
      ];
}
