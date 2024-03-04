import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/repositories/HomeRepository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeRepository repository = HomeRepository();
  List<Post> popularPosts = List.empty();

  @override
  void initState() {
    repository.fetchData().then((resultData) => setState(() {
          popularPosts = resultData['popular']!;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home_outlined),
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                child: Text(
                  'By Genre',
                ),
              ),
              categoryFilter(),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 16, 0, 16),
                child: Text(
                  'Popular Casts',
                ),
              ),
              popularCasts(),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 16, 0, 16),
                child: Text(
                  'Celebrity Favorites',
                ),
              ),
              celebrityFavorites(),
              const SizedBox(
                height: 40,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding celebrityFavorites() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const Image(
                          image: CachedNetworkImageProvider(
                              'https://images.unsplash.com/photo-1421757350652-9f65a35effc7?w=500&h=500'),
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        'Oprah\'s Book Club',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const Image(
                          image: CachedNetworkImageProvider(
                              'https://images.unsplash.com/photo-1581368129682-e2d66324045b?w=500&h=500'),
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        'The Joe Rogan Experience',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const Image(
                          image: CachedNetworkImageProvider(
                              'https://images.unsplash.com/photo-1554200876-adfd2a2048aa?w=500&h=500'),
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        'The Michelle Obama Podcast',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding popularCasts() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
      child: Container(
        width: double.infinity,
        height: 240,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: popularPosts.length,
            itemBuilder: (context, index) {
              Post postItem = popularPosts[index];
              return postCardWidget(postItem);
            }),
      ),
    );
  }

  Widget postCardWidget(Post postItem) {
    return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                          image: CachedNetworkImageProvider(
                              postItem.images?.first ?? ""),
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        postItem.title,
                      ),
                    ],
                  ),
                ),
              ),
            );
  }

  Padding categoryFilter() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Technology',
                      ),
                      Text(
                        'Explore Now',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business',
                      ),
                      Text(
                        'Explore Now',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Container(
                width: 160,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health',
                      ),
                      Text(
                        'Explore Now',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
