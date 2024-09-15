import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/features/forms/view/email_input.dart';
import 'package:pixabay_list/features/forms/view/password_input.dart';
import 'package:pixabay_list/features/login/widgets/header_title.dart';
import 'package:pixabay_list/features/login/widgets/next_button.dart';
import 'package:pixabay_list/features/login/widgets/registration_text_button.dart';

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
                  RegistrationTextButton(),
                  Spacer(),
                  NextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
