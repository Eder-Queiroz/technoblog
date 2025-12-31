import 'package:flutter/material.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class TagFilterChip extends StatelessWidget {
  final Tag tag;
  final bool isSelected;
  final VoidCallback onPressed;

  const TagFilterChip({
    super.key,
    required this.tag,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final radius = Theme.of(context).extension<CommonRadius>()!;

    return ActionChip(
      onPressed: onPressed,
      backgroundColor: isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.surface,
      label: Text(tag.name),
      padding: EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.sm,
      ),
      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.tertiary,
          ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.md),
        side: BorderSide(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}

