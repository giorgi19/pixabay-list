import 'package:flutter/material.dart';

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
        child: Text(error ?? 'error'),
      ),
    );
  }
}
