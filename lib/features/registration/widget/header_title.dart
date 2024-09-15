import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Registration Page',
      key: const Key('registration_header_title'),
      style: theme.textTheme.displaySmall,
    );
  }
}
