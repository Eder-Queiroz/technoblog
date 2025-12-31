// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Article _$ArticleFromJson(Map<String, dynamic> json) => _Article(
  id: bigIntFromJson(json['id']),
  title: json['title'] as String,
  content: json['content'] as String,
  author: GuestUser.fromJson(json['author'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>)
      .map((e) => Tag.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ArticleToJson(_Article instance) => <String, dynamic>{
  'id': bigIntToJson(instance.id),
  'title': instance.title,
  'content': instance.content,
  'author': instance.author,
  'tags': instance.tags,
};
