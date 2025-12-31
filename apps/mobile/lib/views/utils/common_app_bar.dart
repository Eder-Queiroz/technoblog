import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/views/contexts/user_context.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userContextProvider.notifier);

    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final radius = Theme.of(context).extension<CommonRadius>()!;

    return AppBar(
      title: Text('TechBlog'),
      actionsPadding: EdgeInsets.only(right: spacing.md),
      actions: [
        if (user.isAuthenticated)
          Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(radius.lg),
            ),
            child: InkWell(
              onTap: user.logout,
              borderRadius: BorderRadius.circular(radius.lg),
              child: Padding(
                padding: EdgeInsets.all(spacing.sm),
                child: Icon(Icons.logout),
              ),
            ),
          ),
      ],
    );
  }
}
