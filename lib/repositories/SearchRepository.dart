import 'package:base_flutter/models/Post.dart';

class SearchRepository {
  Future<List<Post>> fetchDataByCategory(String categoryType) async {
    return getRecentPostItems();
  }

  Future<List<Post>> fetchDataByQuery(String query) async {
    return getRecentPostItems()
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
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
