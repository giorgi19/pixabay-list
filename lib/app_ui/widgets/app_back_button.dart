import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/colors/app_colors.dart';

/// IconButton displayed in the application.
/// Navigates back when is pressed.
class AppBackButton extends StatelessWidget {
  /// Creates a default instance of [AppBackButton].
  const AppBackButton({
    Key? key,
    VoidCallback? onPressed,
  }) : this._(
          key: key,
          isLight: false,
          onPressed: onPressed,
        );

  /// Creates a light instance of [AppBackButton].
  const AppBackButton.light({
    Key? key,
    VoidCallback? onPressed,
  }) : this._(
          key: key,
          isLight: true,
          onPressed: onPressed,
        );

  const AppBackButton._({required this.isLight, this.onPressed, super.key});

  /// Whether this app button is light.
  final bool isLight;

  /// Called when the back button has been tapped.
  /// Defaults to `Navigator.of(context).pop()`
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      icon: Icon(
        Icons.arrow_back,
        color: isLight ? AppColors.white : AppColors.highEmphasisSurface,
      ),
    );
  }
}
