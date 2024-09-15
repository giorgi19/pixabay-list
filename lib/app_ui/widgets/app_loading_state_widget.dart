import 'package:flutter/material.dart';

class AppLoadingStateWidget extends StatelessWidget {
  const AppLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
