import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/datasources/remote/tags_api.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/domain/tag/repositories/tag_repository.interface.dart';

final tagRepositoryProvider = Provider<ITagRepository>(
  (ref) => TagRepositoryImpl(tagsApi: ref.read(tagsApiProvider)),
);

class TagRepositoryImpl implements ITagRepository {
  final TagsApi _tagsApi;

  TagRepositoryImpl({required TagsApi tagsApi}) : _tagsApi = tagsApi;

  @override
  Future<List<Tag>> getAvailableTags() async {
    return await _tagsApi.getAvailableTags();
  }
}
