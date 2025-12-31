import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_entity.freezed.dart';
part 'tag_entity.g.dart';

@freezed
sealed class Tag with _$Tag {
  const factory Tag({required int id, required String name}) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
