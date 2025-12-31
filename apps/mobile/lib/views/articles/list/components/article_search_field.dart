import 'package:flutter/material.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class ArticleSearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ArticleSearchField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final radius = Theme.of(context).extension<CommonRadius>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing.md),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: 'Pesquisar',
          labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius.lg),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius.lg),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}

