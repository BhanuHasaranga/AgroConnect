import 'dart:convert';

class News {
  final String id;
  final String userId;
  final String headline;
  final String newsContent;
  final String? imageUrl;

  News({
    required this.id,
    required this.userId,
    required this.headline,
    required this.newsContent,
    this.imageUrl,
  });

  News copyWith(
      {String? id,
      String? userId,
      String? headline,
      String? newsContent,
      String? imageUrl}) {
    return News(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      headline: headline ?? this.headline,
      newsContent: newsContent ?? this.newsContent,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'headline': headline,
      'newsContent': newsContent,
      'imageUrl': imageUrl,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as String,
      userId: map['userId'] as String,
      headline: map['headline'] as String,
      newsContent: map['newsContent'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News{id: $id, userId: $userId, headline: $headline, newsContent: $newsContent, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;
    return id == other.id &&
        userId == other.userId &&
        headline == other.headline &&
        newsContent == other.newsContent &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        headline.hashCode ^
        newsContent.hashCode ^
        (imageUrl?.hashCode ?? 0);
  }
}
