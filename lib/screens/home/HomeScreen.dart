import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/repositories/HomeRepository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
  List<Post> celebrityPosts = List.empty();
  List<Post> recentPosts = List.empty();

  @override
  void initState() {
    repository.fetchData().then((resultData) => setState(() {
          popularPosts = resultData['popular']!;
          celebrityPosts = resultData['celebrity']!;
          recentPosts = resultData['recents']!;
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: horizontalCastsWidget("Popular Posts", popularPosts),
          ),
          SliverToBoxAdapter(
            child: horizontalCastsWidget("Celebrity Posts", celebrityPosts),
          ),
          SliverToBoxAdapter(
              child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Text("Recent Posts"),
                  ))),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2칸짜리 그리드
              childAspectRatio: 1, // 그리드 아이템의 비율
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Post postItem = recentPosts[index];
                return postCardWidget(postItem);
              },
              childCount: recentPosts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontalCastsWidget(String titleText, List<Post> targetPosts) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
          child: Text(titleText),
        ),
        SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: targetPosts.length,
                itemBuilder: (context, index) {
                  Post postItem = targetPosts[index];
                  return postCardWidget(postItem);
                }))
      ],
    );
  }

  Widget postCardWidget(Post postItem) {
    return Container(
      width: 160,
      height: 200,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: CachedNetworkImageProvider(postItem.images?.first ?? ""),
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
