import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/theme/app_theme.dart';
import 'package:pixabay_list/features/login/view/login.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      home: const Login(),
    );
  }
}
