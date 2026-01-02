class FormArticleDto {
  final String? title;
  final String? content;
  final List<int> tagIds;

  const FormArticleDto({this.title, this.content, this.tagIds = const []});

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'tagIds': tagIds,
  };

  bool validate() {
    if (title == null || title!.isEmpty) {
      return false;
    }
    if (content == null || content!.isEmpty) {
      return false;
    }

    return true;
  }
}
