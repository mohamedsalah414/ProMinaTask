import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mygallery/modules/gallery/model/gallery_model.dart';
import 'package:mygallery/modules/gallery/repository/images_repo.dart';

final upload = ChangeNotifierProvider((ref) {
  return UploadImage();
});

class UploadImage extends ChangeNotifier {
  final ImagesRepo imagesRepo = ImagesRepo();

  Future<void> uploadImage(path) async {
    imagesRepo.uploadImage(path);
    notifyListeners();
  }
}
