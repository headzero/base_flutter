import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/models/User.dart';

class PostRepository {
  Future<User> fetchUserData(String code) async {
    return User(
        name: "Joseph Hale",
        message: "Craft anything",
        imageUrl:
            "https://fastly.picsum.photos/id/491/300/300.jpg?hmac=nqxHz8st4gF72CiLOQovPViZnuvh7nKSmJjMwyfcmW8",
        code: "test1234");
  }

  Future<Post> fetchData(String id) async {
    return Post(title: 'Oprah\'s Book Club', content: "Oprah's Book Club encourages avid readers to discover new authors and books that ignite conversation. Take a look at Oprah's complete list of recommended ...", images: [
      'https://images.unsplash.com/photo-1421757350652-9f65a35effc7?w=500&h=500',
      'https://images.unsplash.com/photo-1421757350652-9f65a35effc7?w=500&h=500',
      'https://images.unsplash.com/photo-1421757350652-9f65a35effc7?w=500&h=500',
      'https://images.unsplash.com/photo-1421757350652-9f65a35effc7?w=500&h=500'
    ]);
  }
}
