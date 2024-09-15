import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/data/data_sources/remote/authentication_data_source.dart';
import 'package:pixabay_list/data/repository/i_authentication_repository.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';
import 'package:pixabay_list/features/login/cubit/login_cubit.dart';
import 'package:pixabay_list/features/login/widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authenticationRepository: AuthenticationRepository(
              authenticationDataSource: AuthenticationDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => FormsCubit(),
        ),
      ],
      child: const LoginForm(),
    );
  }
}
