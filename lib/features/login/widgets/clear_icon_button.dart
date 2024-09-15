import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';

class ClearIconButton extends StatelessWidget {
  const ClearIconButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('loginWithEmailForm_clearIconButton'),
      padding: const EdgeInsets.only(right: AppSpacing.md),
      child: Visibility(
        child: GestureDetector(
          onTap: onPressed,
          child: const Icon(
            Icons.clear,
          ),
        ),
      ),
    );
  }
}
