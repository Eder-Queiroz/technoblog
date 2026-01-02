import 'package:flutter/material.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final bool enabled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;

  const CommonTextField({
    super.key,
    this.labelText,
    this.onChanged,
    this.validator,
    this.controller,
    this.initialValue,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.enabled = true,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Theme.of(context).extension<CommonRadius>()!;

    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.lg),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.lg),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.lg),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.lg),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.lg),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.lg),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
