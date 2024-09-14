import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/app_ui/widgets/app_email_text_field.dart';
import 'package:pixabay_list/login/cubit/login_cubit.dart';
import 'package:pixabay_list/login/widgets/password_input.dart';
import 'package:pixabay_list/pixabay_feed/view/pixabay_feed.dart';
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
                  _HeaderTitle(),
                  SizedBox(height: AppSpacing.xxxlg),
                  _EmailInput(),
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
