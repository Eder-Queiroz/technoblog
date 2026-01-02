import 'package:flutter/material.dart';
import 'package:mobile/views/utils/common_spacing.dart';
import 'package:mobile/views/utils/common_text_field.dart';

class ArticleSearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const ArticleSearchField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing.md),
      child: CommonTextField(labelText: 'Pesquisar', onChanged: onChanged),
    );
  }
}
