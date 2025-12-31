import 'package:flutter/material.dart';
import 'package:mobile/domain/article/entities/article_entity.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  const ArticleTile({
    super.key,
    required this.article,
    required this.onTap,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Theme.of(context).extension<CommonRadius>()!;
    final spacing = Theme.of(context).extension<CommonSpacing>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(radius.md),
              child: Row(
                spacing: spacing.md,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(radius.md),
                    child: Image.network(
                      'https://static.uwalls.de/products/139000/139990/s45297p.jpg',
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 69,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            spacing: spacing.sm,
                            children: [
                              Flexible(
                                child: Text(
                                  article.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              if (article.tags.isNotEmpty)
                                _buildTagBadge(
                                  context,
                                  article.tags.first.name,
                                ),
                            ],
                          ),
                          Text(
                            article.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (onEdit != null)
            SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                onPressed: onEdit,
                icon: Icon(Icons.edit_document),
                iconSize: 24,
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTagBadge(BuildContext context, String name) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final radius = Theme.of(context).extension<CommonRadius>()!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.sm,
        vertical: spacing.xs,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(radius.full),
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
      ),
    );
  }
}
