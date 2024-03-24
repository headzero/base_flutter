import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/models/User.dart';
import 'package:base_flutter/repositories/PostRepository.dart';
import 'package:base_flutter/screens/imageview/ImageViewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostScreenState();
  }
}

class PostScreenState extends State<PostScreen> {
  PostRepository repository = PostRepository();
  Post post = Post.empty();
  User user = User.empty();

  @override
  void initState() {
    repository.fetchUserData("").then((value) => setState(() {
          user = value;
        }));
    repository.fetchData("").then((value) => setState(() {
          post = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [TitleWidget(), ProfileWidget(), PostWidget()],
        ),
      ),
    );
  }

  Widget TitleWidget() {
    return Container(
        width: double.maxFinite,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(color: Colors.black12),
        child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
            child: Text(
              post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )));
  }

  Widget ProfileWidget() {
    return Container(
        width: double.maxFinite,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(color: Colors.black12),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
          child: Row(mainAxisSize: MainAxisSize.max, children: [
            if (user.imageUrl?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: CachedNetworkImageProvider(user.imageUrl ?? ""),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          ]),
        ));
  }

  Widget PostWidget() {
    return Container(
        width: double.maxFinite,
        alignment: AlignmentDirectional.center,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    post.content,
                    style: const TextStyle(fontSize: 16),
                  )),
              if (post.images?.isNotEmpty == true)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      children: [
                        for (var image in post.images!)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          ImageViewer(imageUrl: image)));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: CachedNetworkImageProvider(image),
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
