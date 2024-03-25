import 'package:base_flutter/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ImageUploader.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key, this.modifyPost});

  final Post? modifyPost;

  @override
  State<StatefulWidget> createState() => WriteState();
}

class WriteState extends State<WriteScreen> {
  bool isModify = false;
  String postId = "";
  String modifyId = "";

  ImageUploader imageUploader = ImageUploader();
  bool _isDialogVisible = false;

  String titleText = "";
  String contentText = "";
  List<String> imageList = List<String>.empty(growable: true);

  @override
  void initState() {
    if (widget.modifyPost != null) {
      var modifyPost = widget.modifyPost!;
      modifyId = modifyPost.id ?? "";
      isModify = modifyId.isEmpty;
      if (isModify) {
        postId = modifyPost.id ?? "";
      }
      titleText = modifyPost.title;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Write",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                validateWritePostThenCreate();
              },
            )
          ],
        ),
        body: Stack(
          children: [
            GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [nameForm(), attachImageForm(), contentForm()],
                  ),
                )),
            Visibility(
                visible: _isDialogVisible,
                child: Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  ),
                ))
          ],
        ));
  }

  Widget nameForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
        child: getTitleText());
  }

  Widget getTitleText() {
    return TextField(
      controller: TextEditingController(text: titleText),
      decoration: const InputDecoration(
        isDense: true,
        border: UnderlineInputBorder(),
        contentPadding: EdgeInsets.all(4),
      ),
      onChanged: (newText) {
        titleText = newText;
      },
    );
  }

  Widget attachImageForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: SizedBox(
            height: 110,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  attachImageBox(0),
                  attachImageBox(1),
                  attachImageBox(2),
                  attachImageBox(3),
                  attachImageBox(4),
                ])));
  }

  Container attachImageBox(int index) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: const Color(0xff777777),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
      child: getImageFrom(imageList, index),
    );
  }

  Widget getImageFrom(List<String> imageList, int index) {
    if (imageList.length <= index) {
      return GestureDetector(
          onTap: () {
            onTabAddImage(imageList);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            width: 100,
            height: 100,
            child: const Icon(
              Icons.image_outlined,
              color: Colors.white,
              size: 32,
            ),
          ));
    } else {
      return GestureDetector(
          onTap: () {
            setState(() {
              imageList.removeAt(index);
            });
          },
          child: Image.network(
            "${imageList[index]}?width=400",
            fit: BoxFit.cover,
          ));
    }
  }

  void onTabAddImage(List<String> imageList) {
    setState(() {
      _isDialogVisible = true;
    });
    imageUploader.chooseAndUploadImage().then((value) => {
          setState(() {
            _isDialogVisible = false;
            if (value != null) imageList.add(value);
          })
        });
  }

  Widget contentForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Container(
            constraints: const BoxConstraints(minHeight: 300),
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: TextField(
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (newText) {
                contentText = newText;
              },
            )));
  }

  void validateWritePostThenCreate() {
    if (titleText.isEmpty || contentText.isEmpty) {
      _showToast("Input Title and Content");
      return;
    }
    Post post = Post(
        id: modifyId,
        title: titleText,
        content: contentText,
        images: imageList);

    if (postId.isEmpty) {
      createWritePost(post.toJson());
    } else {
      modifyWritePost(post.toJson());
    }
  }

  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  void createWritePost(Map<String, dynamic> data) async {
    // TODO : write post Data to server
    Navigator.pop(context);
  }

  void modifyWritePost(Map<String, dynamic> data) {
    // TODO : modify post Data to server
    Navigator.pop(context);
  }
}
