import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app/routes/routes.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';
import 'package:pixabay_list/features/login/cubit/login_cubit.dart';
import 'package:pixabay_list/utils/enum.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final formsState = context.watch<FormsCubit>().state;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, loginState) {
        if (loginState.status == AppStatus.success) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.pixabayFeed,
          );
        }
      },
      builder: (context, loginState) => AppButton.darkAqua(
        key: const Key('loginWithEmailForm_nextButton'),
        onPressed: formsState.isValid ?? false
            ? () async => {
                  await context.read<LoginCubit>().loginWithEmailAndPassword(
                        email: formsState.email?.value,
                        password: formsState.password?.value,
                      ),
                }
            : null,
        child: const Text('Login'),
      ),
    );
  }
}
