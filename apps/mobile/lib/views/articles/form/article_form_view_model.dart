import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/repositories/article_repository_impl.dart';
import 'package:mobile/data/repositories/tag_repository_impl.dart';
import 'package:mobile/domain/article/dtos/form_article_dto.dart';
import 'package:mobile/domain/article/repositories/article_repository.interface.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/domain/tag/repositories/tag_repository.interface.dart';
import 'package:mobile/views/articles/form/article_form_state.dart';
import 'package:mobile/views/articles/list/list_article_view_model.dart';

final articleFormViewModelProvider =
    AutoDisposeNotifierProvider.family<
      ArticleFormViewModel,
      ArticleFormState,
      BigInt?
    >(ArticleFormViewModel.new);

class ArticleFormViewModel
    extends AutoDisposeFamilyNotifier<ArticleFormState, BigInt?> {
  ITagRepository get _tagRepository => ref.read(tagRepositoryProvider);
  IArticleRepository get _articleRepository =>
      ref.read(articleRepositoryProvider);

  @override
  ArticleFormState build(BigInt? articleId) {
    Future.microtask(() async {
      await init();
    });
    return ArticleFormState(articleId: articleId);
  }

  Future<void> init() async {
    await getAvailableTags();
  }

  Future<void> getAvailableTags() async {
    state = state.copyWith(tags: const AsyncValue.loading());
    final tags = await AsyncValue.guard(
      () async => await _tagRepository.getAvailableTags(),
    );
    state = state.copyWith(tags: tags);
  }

  void toggleTagSelection(Tag tag) {
    final selectedTags = state.selectedTags.toSet();

    if (isTagSelected(tag)) {
      selectedTags.remove(tag);
    } else {
      selectedTags.add(tag);
    }

    state = state.copyWith(selectedTags: selectedTags.toList());
  }

  bool isTagSelected(Tag tag) {
    return state.selectedTags.contains(tag);
  }

  bool isEditing() {
    return state.articleId != null;
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  Future<void> sendArticle() async {
    final formArticleDto = FormArticleDto(
      title: state.title,
      content: state.content,
      tagIds: state.selectedTags.map((tag) => tag.id).toList(),
    );

    if (isEditing()) {
      await _updateArticle(formArticleDto);
      return;
    }

    await _createArticle(formArticleDto);
    ref.invalidate(listArticleViewModelProvider);
  }

  Future<void> _createArticle(FormArticleDto dto) async {
    await _articleRepository.createArticle(dto);
  }

  Future<void> _updateArticle(FormArticleDto dto) async {
    // await _articleRepository.updateArticle(formArticleDto);
  }
}
