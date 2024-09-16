import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/typography/app_text_styles.dart';

class AppErrorStateWidget extends StatelessWidget {
  const AppErrorStateWidget({
    this.error,
    super.key,
  });

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          // Needs to be replaced with user-friendly error messages.
          // error ??
          'Error',
          style: UITextStyle.headline3,
        ),
      ),
    );
  }
}
