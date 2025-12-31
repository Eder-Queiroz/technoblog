import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/views/articles/list/components/tag_filter/tag_filter_chip.dart';
import 'package:mobile/views/articles/list/components/tag_filter/tag_filter_loading.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class TagFilterList extends StatelessWidget {
  final AsyncValue<List<Tag>> tags;
  final bool Function(Tag) isTagSelected;
  final void Function(Tag) onTagToggle;

  const TagFilterList({
    super.key,
    required this.tags,
    required this.isTagSelected,
    required this.onTagToggle,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;

    return tags.when(
      data: (tagList) {
        return SizedBox(
          height: 36,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            itemBuilder: (context, index) {
              final tag = tagList[index];
              return TagFilterChip(
                tag: tag,
                isSelected: isTagSelected(tag),
                onPressed: () => onTagToggle(tag),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: spacing.sm);
            },
            itemCount: tagList.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
      error: (err, st) {
        return const SizedBox.shrink();
      },
      loading: () {
        return const TagFilterLoading();
      },
    );
  }
}
