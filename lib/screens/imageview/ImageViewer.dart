import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  ImageViewer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      PhotoView(
        imageProvider: NetworkImage(imageUrl),
        // 이미지가 화면에 꽉 차게 설정
        minScale: PhotoViewComputedScale.contained * 1,
        maxScale: PhotoViewComputedScale.covered * 2,
        // 사용자가 화면 밖으로 벗어나지 않도록 제한
        initialScale: PhotoViewComputedScale.contained,
        backgroundDecoration: BoxDecoration(
          color: Colors.black, // 배경을 검은색으로 설정하여 이미지가 더 돋보이게 함
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.white),
            )),
      )
    ]));
  }
}
