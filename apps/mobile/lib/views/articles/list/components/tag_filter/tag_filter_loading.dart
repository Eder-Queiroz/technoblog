import 'package:flutter/material.dart';
import 'package:mobile/views/utils/common_spacing.dart';
import 'package:mobile/views/utils/shimmer.dart';

class TagFilterLoading extends StatelessWidget {
  final int itemCount;

  const TagFilterLoading({
    super.key,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final radius = Theme.of(context).extension<CommonRadius>()!;

    return SizedBox(
      height: 32,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.md,
        ),
        itemBuilder: (context, index) => Shimmer(
          width: 100,
          height: 32,
          borderRadius: radius.md,
        ),
        separatorBuilder: (context, index) => SizedBox(width: spacing.sm),
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

