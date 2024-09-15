import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app/routes/routes.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/features/login/cubit/login_cubit.dart';
import 'package:pixabay_list/utils/enum.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, loginState) {
        if (loginState.status == AppStatus.success) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.registration,
          );
        }
      },
      builder: (context, loginState) => AppButton.darkAqua(
        key: const Key('loginWithEmailForm_nextButton'),
        onPressed: loginState.isValid ?? false
            ? () async => {
                  await context.read<LoginCubit>().loginWithEmailAndPassword(),
                }
            : null,
        child: const Text('Login'),
      ),
    );
  }
}
