import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';

@immutable
class ArticleFormState {
  final BigInt? articleId;
  final AsyncValue<List<Tag>> tags;
  final List<Tag> selectedTags;
  final String title;
  final String content;

  const ArticleFormState({
    this.articleId,
    this.tags = const AsyncValue.loading(),
    this.selectedTags = const [],
    this.title = '',
    this.content = '',
  });

  ArticleFormState copyWith({
    AsyncValue<List<Tag>>? tags,
    List<Tag>? selectedTags,
    String? title,
    String? content,
  }) {
    return ArticleFormState(
      tags: tags ?? this.tags,
      articleId: articleId,
      selectedTags: selectedTags ?? this.selectedTags,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
