import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/widgets/app_password_text_field.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formsState = context.watch<FormsCubit>().state;

    return AppPasswordTextField(
      key: const Key('passwordInput_textField'),
      controller: _controller,
      hintText: 'Password',
      onChanged: (password) =>
          context.read<FormsCubit>().passwordChanged(passwordString: password),
      errorText: formsState.password?.error?.name,
    );
  }
}
