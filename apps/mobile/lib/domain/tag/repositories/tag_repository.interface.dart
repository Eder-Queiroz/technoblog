import "package:mobile/domain/tag/entities/tag_entity.dart";

abstract interface class ITagRepository {
  Future<List<Tag>> getAvailableTags();
}
