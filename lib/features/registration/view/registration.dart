import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_back_button.dart';
import 'package:pixabay_list/data/data_sources/remote/authentication_data_source.dart';
import 'package:pixabay_list/data/repository/i_authentication_repository.dart';
import 'package:pixabay_list/features/forms/cubit/forms_cubit.dart';
import 'package:pixabay_list/features/forms/view/age_input.dart';
import 'package:pixabay_list/features/forms/view/email_input.dart';
import 'package:pixabay_list/features/forms/view/password_input.dart';
import 'package:pixabay_list/features/registration/cubit/registration_cubit.dart';
import 'package:pixabay_list/features/registration/widget/header_title.dart';
import 'package:pixabay_list/features/registration/widget/registration_button.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationCubit(
            authenticationRepository: AuthenticationRepository(
              authenticationDataSource: AuthenticationDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => FormsCubit(),
        ),
      ],
      child: const RegistrationView(),
    );
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
                  AgeInput(),
                  Spacer(),
                  RegistrationButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
