import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/models/User.dart';
import 'package:base_flutter/repositories/UserRepository.dart';
import 'package:base_flutter/screens/widgets/WidgetForList.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  User user = User.empty();

  @override
  void initState() {
    repository.fetchUserData("").then((value) => setState(() {
          user = value;
        }));
    repository.fetchDataByUser().then((resultData) => setState(() {
          recentPosts = resultData;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                  width: double.maxFinite,
                  alignment: AlignmentDirectional.center,
                  decoration: const BoxDecoration(color: Colors.black12),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image:
                                CachedNetworkImageProvider(user.imageUrl ?? ""),
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              user.name!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            user.message!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ))),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 2칸짜리 그리드
              childAspectRatio: 2 / 3, // 그리드 아이템의 비율
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                Post postItem = recentPosts[index];
                return postCardWidget(context, postItem);
              },
              childCount: recentPosts.length,
            ),
          ),
        ],
      ),
    );
  }
}
