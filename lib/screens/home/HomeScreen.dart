import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/repositories/HomeRepository.dart';
import 'package:base_flutter/screens/widgets/WidgetForList.dart';
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
          recentPosts = resultData['recent']!;
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
                    child: Text("Recent Posts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
                  ))),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
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
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: Text(titleText, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
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
}
