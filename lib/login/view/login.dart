import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/login/cubit/login_cubit.dart';
import 'package:pixabay_list/login/widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static Route<void> route() =>
      MaterialPageRoute<void>(builder: (_) => const Login());

  static const String name = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginForm(),
    );
  }
}
