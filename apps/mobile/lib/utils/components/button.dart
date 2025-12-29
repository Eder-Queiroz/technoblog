import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Future<void> Function()? onPressedAsync;
  final bool isLoading;
  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.onPressedAsync,
    this.isLoading = false,
  }) : assert(
         (onPressed != null) ^ (onPressedAsync != null),
         'Exactly one of onPressed or onPressedAsync must be provided',
       );

  bool get isAsyncFunction => onPressedAsync != null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isAsyncFunction
          ? () async => await onPressedAsync?.call()
          : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(opacity: isLoading ? 0.0 : 1.0, child: Text(label)),

          if (isLoading)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
