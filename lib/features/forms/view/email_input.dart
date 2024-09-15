import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/widgets/app_email_text_field.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';
import 'package:pixabay_list/features/login/widgets/clear_icon_button.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formsState = context.watch<FormsCubit>().state;

    return AppEmailTextField(
      key: const Key('emailInput_textField'),
      controller: _controller,
      hintText: 'Email',
      onChanged: (email) =>
          context.read<FormsCubit>().emailChanged(emailString: email),
      errorText: formsState.email?.error?.name,
      suffix: ClearIconButton(
        onPressed: () {
          _controller.clear();
          context.read<FormsCubit>().emailChanged(emailString: '');
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
