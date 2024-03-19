import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/repositories/UserRepository.dart';
import 'package:base_flutter/screens/widgets/WidgetForList.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserScreenState();
  }
}

class UserScreenState extends State<UserScreen> {
  UserRepository repository = UserRepository();
  List<Post> recentPosts = List.empty();

  @override
  void initState() {
    repository.fetchDataByUser().then((resultData) => setState(() {
          recentPosts = resultData;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home_outlined),
        title: const Text("User"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                    child: null,
                  ))),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 2칸짜리 그리드
              childAspectRatio: 2/3, // 그리드 아이템의 비율
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
}
