import 'package:base_flutter/models/User.dart';

class Post {
  final String title;
  final String content;
  final List<String>? images; // ?? 1? 여러개??
  final String? link; // 동영상 링크등등.
  final String? id; // 게시글 아이디.
  final String? writerCode; // 작성자 코드.
  // 추가로 필요한거

  Post({
    required this.title,
    required this.content,
    this.images,
    this.link,
    this.id,
    this.writerCode,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['content'],
      images: json['images'] != null
          ? (json['images'] as List).map((e) => e.toString()).toList()
          : [],
      link: json['link'],
      id: json['_id'],
      writerCode: json['writerCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'images': images,
      'link': link,
      'writerCode': writerCode
    };
  }

  static Post empty() {
    return Post(title: "", content: "");
  }
}