import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/domain/article/entities/article_entity.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';

@immutable
class ListArticleState {
  final AsyncValue<List<Tag>> tags;
  final List<Tag> selectedTags;
  final String search;
  final PagingState<int, Article> pagingState;

  const ListArticleState({
    this.tags = const AsyncValue.loading(),
    this.selectedTags = const [],
    required this.pagingState,
    this.search = '',
  });

  ListArticleState copyWith({
    AsyncValue<List<Tag>>? tags,
    List<Tag>? selectedTags,
    PagingState<int, Article>? pagingState,
    String? search,
  }) {
    return ListArticleState(
      tags: tags ?? this.tags,
      selectedTags: selectedTags ?? this.selectedTags,
      pagingState: pagingState ?? this.pagingState,
      search: search ?? this.search,
    );
  }
}
