import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mygallery/modules/gallery/viewmodel/gallery.dart';
import 'package:mygallery/modules/gallery/viewmodel/upload.dart';

class UploadImagePage extends ConsumerStatefulWidget {
  final String type;

  const UploadImagePage({Key? key, required this.type}) : super(key: key);

  @override
  ConsumerState createState() => _UploadImageState();
}

class _UploadImageState extends ConsumerState<UploadImagePage> {
  var _image;
  var imagePicker;
  var path;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    ref.read(upload);
    ref.read(image);
  }

  @override
  Widget build(BuildContext context) {
    final up = ref.watch(upload);
    final img = ref.watch(image);
    return Scaffold(
      appBar: AppBar(),
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  print('tapped');
                  var source = widget.type == 'camera'
                      ? ImageSource.camera
                      : ImageSource.gallery;
                  XFile image = await imagePicker.pickImage(
                      source: source,
                      imageQuality: 50,
                      preferredCameraDevice: CameraDevice.front);
                  setState(() {
                    print('pathhhhhh' + image.path);
                    path = image.path;
                    _image = File(image.path);
                  });
                },
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : const CircleAvatar(
                        radius: 150,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Visibility(
              visible: path != null,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 19,
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    up.uploadImage(path).then((value) {
                      Navigator.of(context).pop();
                      ref.refresh(image).init();
                    });
                  },
                  child: const Text(
                    'Upload',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
