import 'package:flutter/material.dart';
import 'package:pixabay_list/app/routes/routes.dart';

class RegistrationTextButton extends StatelessWidget {
  const RegistrationTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(
        context,
        AppRoutes.registration,
      ),
      child: const Text('Registration'),
    );
  }
}
