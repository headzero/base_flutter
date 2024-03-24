import 'package:base_flutter/models/Post.dart';
import 'package:base_flutter/screens/post/PostScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget postCardWidget(BuildContext context, Post postItem) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => const PostScreen()));
    },
    child: Container(
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
    ),
  );
}
