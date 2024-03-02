
class User {
  String? name;
  String? message;
  String? imageUrl;
  String? code;

  User(
      {this.name,
      this.message,
      this.imageUrl,
      this.code});

  // JSON에서 Dart 객체로 변환
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        message: json['message'],
        imageUrl: json['imageUrl'],
        code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'imageUrl': imageUrl,
      'code': code,
    };
  }
}
