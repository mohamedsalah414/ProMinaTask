import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mygallery/modules/gallery/model/gallery_model.dart';
import 'package:mygallery/modules/gallery/repository/images_repo.dart';

final image = ChangeNotifierProvider((ref) {
  return Images();
});

class Images extends ChangeNotifier {
  final ImagesRepo imagesRepo = ImagesRepo();
  late Future<Gallery> futureImages;


  Future<Gallery> getAllImages() async {
    debugPrint('getAllImages');
    // notifyListeners();
    return await imagesRepo.getAllImages();
  }
 void init() {
   debugPrint('futureImages');
    futureImages =  getAllImages();
    notifyListeners();
  }
}
