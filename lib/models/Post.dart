import 'package:base_flutter/models/User.dart';

class Post {
  final String title;
  final String content;
  final List<String>? images;
  final String? link;
  final String? id;
  final String? writerCode;

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

}