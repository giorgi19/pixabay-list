import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app/routes/routes.dart';
import 'package:pixabay_list/app_ui/widgets/app_button.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';
import 'package:pixabay_list/features/registration/cubit/registration_cubit.dart';
import 'package:pixabay_list/utils/enum.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final formsState = context.watch<FormsCubit>().state;

    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, registrationState) {
        if (registrationState.status == AppStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.pixabayFeed,
            (route) => false,
          );
        }
      },
      builder: (context, registrationState) {
        final isValid = formsState.isValid ?? false;
        final ageIsValid = formsState.ageIsValid ?? false;
        return AppButton.smallTransparent(
          key: const Key('registration_Button'),
          onPressed: isValid && ageIsValid
              ? () async => {
                    await context.read<RegistrationCubit>().registration(
                          email: formsState.email?.value,
                          password: formsState.password?.value,
                          age: int.parse(formsState.age?.value ?? '0'),
                        ),
                  }
              : null,
          child: const Text('Register'),
        );
      },
    );
  }
}
