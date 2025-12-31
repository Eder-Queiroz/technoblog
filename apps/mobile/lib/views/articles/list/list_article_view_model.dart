import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/data/repositories/article_repository_impl.dart';
import 'package:mobile/data/repositories/tag_rpository_impl.dart';
import 'package:mobile/domain/article/dtos/paginated_articles_params_dto.dart';
import 'package:mobile/domain/article/entities/article_entity.dart';
import 'package:mobile/domain/article/repositories/article_repository.interface.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/domain/tag/repositories/tag_repository.interface.dart';
import 'package:mobile/views/articles/list/list_article_state.dart';
import 'package:mobile/views/utils/debounce.dart';

final listArticleViewModelProvider =
    NotifierProvider<ListArticleViewModel, ListArticleState>(
      ListArticleViewModel.new,
    );

class ListArticleViewModel extends Notifier<ListArticleState> {
  late final ITagRepository _tagRepository;
  late final IArticleRepository _articleRepository;
  late final Debounce _searchDebounce;

  @override
  ListArticleState build() {
    _tagRepository = ref.read(tagRepositoryProvider);
    _articleRepository = ref.read(articleRepositoryProvider);
    _searchDebounce = Debounce(duration: const Duration(milliseconds: 500));

    final pagingState = PagingState<int, Article>();

    return ListArticleState(pagingState: pagingState);
  }

  Future<void> init() async {
    await getAvailableTags();
  }

  Future<void> fetchArticles() async {
    if (state.pagingState.isLoading) return;

    state = state.copyWith(
      pagingState: state.pagingState.copyWith(isLoading: true),
    );

    try {
      final pageKey = state.pagingState.nextIntPageKey;

      final params = PaginatedArticlesParamsDto(
        page: pageKey,
        tags: state.selectedTags,
        search: state.search,
      );

      final result = await _articleRepository.getPaginatedArticles(params);
      final articles = result.data;

      final newPages = [...?state.pagingState.pages, articles];
      final newKeys = [...?state.pagingState.keys, pageKey];
      final hasNextPage = articles.isNotEmpty;

      state = state.copyWith(
        pagingState: state.pagingState.copyWith(
          pages: newPages,
          keys: newKeys,
          hasNextPage: hasNextPage,
          isLoading: false,
          error: null,
        ),
      );
    } catch (e) {
      state = state.copyWith(
        pagingState: state.pagingState.copyWith(error: e, isLoading: false),
      );
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(pagingState: state.pagingState.reset());
    await fetchArticles();
  }

  Future<void> getAvailableTags() async {
    state = state.copyWith(tags: const AsyncValue.loading());

    final tags = await AsyncValue.guard(
      () async => await _tagRepository.getAvailableTags(),
    );

    state = state.copyWith(tags: tags);
  }

  Future<void> toggleTagSelection(Tag tag) async {
    final selectedTags = state.selectedTags.toSet();

    if (isTagSelected(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }

    state = state.copyWith(selectedTags: selectedTags.toList());

    await refresh();
  }

  Future<void> searchArticles(String value) async {
    state = state.copyWith(search: value);

    _searchDebounce.call(() async {
      await refresh();
    });
  }

  bool isTagSelected(Tag tag) {
    final selectedIds = state.selectedTags.toSet();
    return selectedIds.contains(tag);
  }
}
