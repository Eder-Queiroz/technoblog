// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_article_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedArticle _$PaginatedArticleFromJson(Map<String, dynamic> json) =>
    _PaginatedArticle(
      data: (json['data'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedArticleToJson(_PaginatedArticle instance) =>
    <String, dynamic>{'data': instance.data, 'total': instance.total};
