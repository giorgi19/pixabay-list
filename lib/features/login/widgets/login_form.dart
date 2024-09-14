import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/features/login/cubit/login_cubit.dart';
import 'package:pixabay_list/features/login/widgets/email_input.dart';
import 'package:pixabay_list/features/login/widgets/header_title.dart';
import 'package:pixabay_list/features/login/widgets/password_input.dart';
import 'package:pixabay_list/features/pixabay_feed/view/pixabay_feed.dart';
import 'package:pixabay_list/utils/enum.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.xlg,
                AppSpacing.lg,
                AppSpacing.xlg,
                AppSpacing.xxlg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderTitle(),
                  SizedBox(height: AppSpacing.xxxlg),
                  EmailInput(),
                  PasswordInput(),
                  _RegistrationTextButton(),
                  Spacer(),
                  _NextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClearIconButton extends StatelessWidget {
  const ClearIconButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('loginWithEmailForm_clearIconButton'),
      padding: const EdgeInsets.only(right: AppSpacing.md),
      child: Visibility(
        child: GestureDetector(
          onTap: onPressed,
          child: const Icon(
            Icons.clear,
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, loginState) {
        if (loginState.status == AppStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PixabayFeed()),
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

class _RegistrationTextButton extends StatelessWidget {
  const _RegistrationTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PixabayFeed()),
        );
      },
      child: const Text('Registration'),
    );
  }
}
