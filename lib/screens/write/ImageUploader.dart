import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader {
  final picker = ImagePicker();

  Future<File?> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    var compressedImage = await _compressImage(imageFile);
    if(compressedImage == null) return null;

    // todo : upload imageFile to Server
    return imageFile.uri.toString();
  }

  Future<String?> chooseAndUploadImage() async {
    File? imageFile = await _getImageFromGallery();
    if (imageFile != null) {
      return await _uploadImage(imageFile);
    } else {
      return null;
    }
  }

  Future<File?> _compressImage(File originalFile, {int targetSizeKilobytes = 1000}) async {
    Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
      originalFile.absolute.path,
      minWidth: 1024,
      minHeight: 1024,
      quality: 75,
    );

    if (compressedBytes == null) return null;

    // loop compressed size under size limit
    while (compressedBytes!.length > targetSizeKilobytes * 1024) {
      var compressWithList = await FlutterImageCompress.compressWithList(compressedBytes,
          minWidth: 1024, minHeight: 1024, quality: 85);

      compressedBytes = compressWithList;
    }

    // save to compressedFile
    final compressedFile = await File('${originalFile.path}.jpg').writeAsBytes(compressedBytes);

    return compressedFile;
  }
}
