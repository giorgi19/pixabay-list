import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/app_ui/widgets/app_email_text_field.dart';
import 'package:pixabay_list/app_ui/widgets/app_password_text_field.dart';
import 'package:pixabay_list/login/cubit/login_cubit.dart';

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
                  _HeaderTitle(),
                  SizedBox(height: AppSpacing.xxxlg),
                  _EmailInput(),
                  PasswordInput(),
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

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Login Page',
      key: const Key('loginWithEmailForm_header_title'),
      style: theme.textTheme.displaySmall,
    );
  }
}

class _EmailInput extends StatefulWidget {
  const _EmailInput();

  @override
  State<_EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginCubit>().state;

    return AppEmailTextField(
      key: const Key('loginWithEmailForm_emailInput_textField'),
      controller: _controller,
      hintText: 'Email',
      onChanged: (email) =>
          context.read<LoginCubit>().emailChanged(emailString: email),
      errorText: state.email?.error?.name,
      suffix: ClearIconButton(onPressed: () {
        _controller.clear();
        context.read<LoginCubit>().emailChanged(emailString: '');
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        visible: true,
        child: GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.clear,
            )
            //  Assets.icons.closeCircle.svg(),
            ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginCubit>().state;

    return AppButton.darkAqua(
      key: const Key('loginWithEmailForm_nextButton'),
      onPressed: state.isValid ?? false
          ? () => {
                // Navigation
              }
          : null,
      child: const Text('Login'),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginCubit>().state;

    return AppPasswordTextField(
      key: const Key('loginWithEmailForm_emailInput_textField'),
      controller: _controller,
      hintText: 'Password',
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(passwordString: password),
      errorText: state.password?.error?.name,
    );
  }
}
