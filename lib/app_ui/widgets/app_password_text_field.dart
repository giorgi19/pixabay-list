import 'package:flutter/material.dart';
import 'package:pixabay_list/app_ui/colors/app_colors.dart';
import 'package:pixabay_list/app_ui/spacing/app_spacing.dart';
import 'package:pixabay_list/app_ui/widgets/app_text_field.dart';

/// An password text field component.
class AppPasswordTextField extends StatelessWidget {
  const AppPasswordTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffix,
    this.readOnly,
    this.onChanged,
    this.errorText,
    this.obscureText,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool? readOnly;

  /// Text that appears below the field.
  final String? errorText;

  /// Controls whether the text in the field should be obscured (hidden),
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hintText,
      keyboardType: TextInputType.emailAddress,
      autoFillHints: const [AutofillHints.password],
      autocorrect: false,
      prefix: const Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.sm,
          right: AppSpacing.sm,
        ),
        child: Icon(
          Icons.password,
          color: AppColors.mediumEmphasisSurface,
          size: 24,
        ),
      ),
      obscureText: true,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      suffix: suffix,
      errorText: errorText,
    );
  }
}
