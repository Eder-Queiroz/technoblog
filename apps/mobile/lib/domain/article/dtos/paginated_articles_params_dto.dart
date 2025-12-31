import 'package:mobile/domain/tag/entities/tag_entity.dart';

class PaginatedArticlesParamsDto {
  final int page;
  final int limit;
  final String? search;
  final List<Tag>? tags;

  PaginatedArticlesParamsDto({
    required this.page,
    this.limit = 10,
    this.search,
    this.tags,
  });

  bool get _hasSearch {
    final search = this.search ?? '';

    return search.isNotEmpty;
  }

  bool get _hasTags {
    final tags = this.tags ?? [];

    return tags.isNotEmpty;
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    if (_hasSearch) 'search': search,
    if (_hasTags) 'tagIds': tags!.map((tag) => tag.id).join(','),
  };
}
