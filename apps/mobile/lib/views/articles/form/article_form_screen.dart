import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/router/articles/articles_route.dart';
import 'package:mobile/utils/components/button.dart';
import 'package:mobile/views/articles/form/article_form_view_model.dart';
import 'package:mobile/views/articles/list/components/tag_filter/tag_filter_chip.dart';
import 'package:mobile/views/utils/common_app_bar.dart';
import 'package:mobile/views/utils/common_spacing.dart';
import 'package:mobile/views/utils/common_text_field.dart';

class ArticleFormScreen extends ConsumerStatefulWidget {
  final BigInt? articleId;
  const ArticleFormScreen({super.key, this.articleId});

  @override
  ConsumerState<ArticleFormScreen> createState() => _ArticleFormScreenState();
}

class _ArticleFormScreenState extends ConsumerState<ArticleFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final ArticleFormViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(
      articleFormViewModelProvider(widget.articleId).notifier,
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = Theme.of(context).extension<CommonSpacing>()!;
    final state = ref.watch(articleFormViewModelProvider(widget.articleId));

    return Scaffold(
      appBar: CommonAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(spacing.md),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: spacing.md,
              children: [
                Text(
                  _viewModel.isEditing() ? 'Editar artigo' : 'Novo artigo',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Título do artigo *',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                CommonTextField(
                  labelText: 'Título',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um título';
                    }
                    return null;
                  },
                  onChanged: _viewModel.setTitle,
                ),
                state.tags.when(
                  data: (tags) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tags *',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Wrap(
                          spacing: spacing.sm,
                          children: tags
                              .map(
                                (tag) => TagFilterChip(
                                  tag: tag,
                                  isSelected: _viewModel.isTagSelected(tag),
                                  onPressed: () {
                                    _viewModel.toggleTagSelection(tag);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) {
                    return const SizedBox.shrink();
                  },
                  loading: () {
                    return const SizedBox.shrink();
                  },
                ),
                Text(
                  'Conteúdo *',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                CommonTextField(
                  hintText: 'Escreva aqui seu artigo...',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 10,
                  minLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o conteúdo';
                    }
                    return null;
                  },
                  onChanged: _viewModel.setContent,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 50,
                  ),
                  child: Button(
                    label: _viewModel.isEditing()
                        ? 'Editar artigo'
                        : 'Criar artigo',
                    onPressedAsync: () async {
                      if (_formKey.currentState!.validate()) {
                        await _viewModel.sendArticle();

                        if (!context.mounted) {
                          return;
                        }

                        ListArticlesRoute().go(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
