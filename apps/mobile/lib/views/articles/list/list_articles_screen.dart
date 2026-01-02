import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobile/domain/article/entities/article_entity.dart';
import 'package:mobile/router/articles/articles_route.dart';
import 'package:mobile/views/articles/list/components/article_search_field.dart';
import 'package:mobile/views/articles/list/components/article_tile.dart';
import 'package:mobile/views/articles/list/components/tag_filter/tag_filter_list.dart';
import 'package:mobile/views/articles/list/list_article_view_model.dart';
import 'package:mobile/views/contexts/user_context.dart';
import 'package:mobile/views/utils/common_app_bar.dart';
import 'package:mobile/views/utils/common_spacing.dart';

class ListArticlesScreen extends ConsumerStatefulWidget {
  const ListArticlesScreen({super.key});

  @override
  ConsumerState<ListArticlesScreen> createState() => _ListArticlesScreenState();
}

class _ListArticlesScreenState extends ConsumerState<ListArticlesScreen> {
  late final ListArticleViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(listArticleViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final state = ref.watch(listArticleViewModelProvider);
    final contextUser = ref.watch(userContextProvider);

    return Scaffold(
      appBar: CommonAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NewArticleFormRoute().push(context);
        },
        child: Icon(
          Icons.add_rounded,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _viewModel.refresh,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: spacing.md, bottom: spacing.md),
                  child: ArticleSearchField(
                    onChanged: _viewModel.searchArticles,
                  ),
                ),
              ),

              // Tag Filter List como um Sliver
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: spacing.md),
                  child: TagFilterList(
                    tags: state.tags,
                    isTagSelected: _viewModel.isTagSelected,
                    onTagToggle: _viewModel.toggleTagSelection,
                  ),
                ),
              ),

              PagedSliverList<int, Article>(
                state: state.pagingState,
                fetchNextPage: _viewModel.fetchArticles,
                builderDelegate: PagedChildBuilderDelegate<Article>(
                  itemBuilder: (context, item, index) {
                    return ArticleTile(
                      article: item,
                      onEdit: item.canBeEditedBy(contextUser)
                          ? () {
                              EditArticleFormRoute(id: item.id).push(context);
                            }
                          : null,
                      onTap: () {
                        ArticleDetailRoute(id: item.id).push(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
