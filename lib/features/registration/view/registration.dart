import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/widgets/app_back_button.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegistrationView();
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
    );
  }
}
