import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/widgets/app_age_text_field.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';

class AgeInput extends StatefulWidget {
  const AgeInput({super.key});

  @override
  State<AgeInput> createState() => _AgeInputState();
}

class _AgeInputState extends State<AgeInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formsState = context.watch<FormsCubit>().state;

    return AppAgeTextField(
      key: const Key('age_textField'),
      controller: _controller,
      hintText: 'Age',
      onChanged: (age) => context.read<FormsCubit>().ageChanged(ageString: age),
      errorText: formsState.age?.error,
    );
  }
}
