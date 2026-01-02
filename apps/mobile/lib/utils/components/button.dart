import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Future<void> Function()? onPressedAsync;
  final void Function(Object error, StackTrace stackTrace)? onError;

  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.onPressedAsync,
    this.onError,
  }) : assert(
         (onPressed != null) ^ (onPressedAsync != null),
         'Exactly one of onPressed or onPressedAsync must be provided',
       );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isLoading = false;

  bool get isAsyncFunction => widget.onPressedAsync != null;

  Future<void> _handleAsyncPress() async {
    if (_isLoading) return;

    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressedAsync?.call();
    } catch (error, stackTrace) {
      if (widget.onError != null) {
        widget.onError!(error, stackTrace);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : (isAsyncFunction ? _handleAsyncPress : widget.onPressed),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(opacity: _isLoading ? 0.0 : 1.0, child: Text(widget.label)),

          if (_isLoading)
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
