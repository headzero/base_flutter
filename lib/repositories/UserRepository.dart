import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/models/User.dart';

class UserRepository {
  Future<User> fetchUserData(String code) async {
    return User(name: "Joseph Hale", message: "Craft anything", imageUrl: "https://fastly.picsum.photos/id/491/300/300.jpg?hmac=nqxHz8st4gF72CiLOQovPViZnuvh7nKSmJjMwyfcmW8", code: "test1234");
  }

  Future<List<Post>> fetchDataByUser() async {
    return getRecentPostItems();
  }

  List<Post> getRecentPostItems() {
    return getCelebrityPostItems() +
        getPopularPostItems() +
        getCelebrityPostItems() +
        getPopularPostItems();
  }

  List<Post> getCelebrityPostItems() {
    return [
      Post(title: 'Oprah\'s Book Club', content: '', images: [
        'https://images.unsplash.com/photo-1421757350652-9f65a35effc7?w=500&h=500'
      ]),
      Post(title: 'The Joe Rogan Experience', content: '', images: [
        'https://images.unsplash.com/photo-1581368129682-e2d66324045b?w=500&h=500'
      ]),
      Post(title: 'The Michelle Obama Podcast', content: '', images: [
        'https://images.unsplash.com/photo-1554200876-adfd2a2048aa?w=500&h=500'
      ])
    ];
  }

  List<Post> getPopularPostItems() {
    return [
      Post(title: 'The Daily', content: '', images: [
        'https://images.unsplash.com/photo-1668536784894-f8113d91f991?w=500&h=500'
      ]),
      Post(title: 'Serial', content: '', images: [
        'https://images.unsplash.com/photo-1613485252551-d95ef3015d0e?w=500&h=500'
      ]),
      Post(title: 'Radiolab', content: '', images: [
        'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=500&h=500'
      ])
    ];
  }
}
