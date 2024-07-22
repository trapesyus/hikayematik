class GenericModel {
  final int id;
  final String title;
  final String content;

  GenericModel({
    required this.id,
    required this.title,
    required this.content,
  });

  factory GenericModel.fromJson(Map<String, dynamic> json) {
    return GenericModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
