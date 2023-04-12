import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mygallery/modules/gallery/view/upload_page.dart';
import 'package:mygallery/modules/login/view/login_view.dart';

Future<dynamic> buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierColor: Colors.transparent,
    useSafeArea: true,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .3,
                color: Colors.white.withOpacity(0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const UploadImagePage(type: 'gallery'),
                              )).then((value) => Navigator.of(context).pop());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEFD8F9)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/icons/gallery.png', scale: 4),
                            20.pw,
                            const Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    20.ph,
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const UploadImagePage(type: 'camera'),
                              )).then((value) => Navigator.of(context).pop());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEBF6FF)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/icons/3.png', scale: 4),
                            20.pw,
                            const Text(
                              'Camera',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
