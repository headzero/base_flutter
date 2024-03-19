// generate repository class that fecches data from the 'https://example.com/api' server

import 'package:http/http.dart' as http;
import 'package:base_flutter/models/Post.dart';

class HomeRepository {
  static const String baseUrl = 'https://example.com/api';

  Future<Map<String, List<Post>>> fetchData() async {
    // final response = await http.get(Uri.parse(baseUrl));

    // if (response.statusCode == 200) {
    //   return response.body;
    // } else {
    //   throw Exception('Failed to fetch data');
    // }

    // Group the post items by 'Celebrity', 'popular', and 'recents'
    Map<String, List<Post>> groupedPostItems = {};
    groupedPostItems['popular'] = getPopularPostItems();
    groupedPostItems['celebrity'] = getCelebrityPostItems();
    groupedPostItems['recent'] = getRecentPostItems();

    return groupedPostItems;
  }

  List<Post> getRecentPostItems() {
    return getCelebrityPostItems() + getPopularPostItems() + getCelebrityPostItems() + getPopularPostItems();
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
