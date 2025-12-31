import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/services/api/api_client.dart';

final tagsApiProvider = Provider<TagsApi>(
  (ref) => TagsApi(apiClient: ref.read(apiClientProvider)),
);

class TagsApi {
  final ApiClient _apiClient;

  TagsApi({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<Tag>> getAvailableTags() async {
    return await _apiClient.getList<Tag>('/tags', deserialize: Tag.fromJson);
  }
}
