import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';
import 'package:pixabay_list/features/registration/cubit/registration_cubit.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final formsState = context.watch<FormsCubit>().state;

    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, registrationState) {},
      builder: (context, registrationState) {
        return AppButton.smallTransparent(
          key: const Key('registration_Button'),
          onPressed: formsState.isValid ?? false ? () async => {} : null,
          child: const Text('Register'),
        );
      },
    );
  }
}
