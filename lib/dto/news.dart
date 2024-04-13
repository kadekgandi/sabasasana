class News {
  final int id;
  final String title;
  final String body;

  News({required this.id, required this.title, required this.body});

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        title: json['title'],
        body: json['body'],
      );

  News copyWith({int? id, String? title, String? body}) {
    return News(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

}