import 'package:flutter/material.dart';
import 'package:mygallery/view/gallery/widgets/dialog.dart';
import 'package:mygallery/view/login/login_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/gallery.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome\nMina',
                        style: TextStyle(color: Colors.black, fontSize: 32),
                      ),
                      CircleAvatar(
                        radius: 35,
                        child: Image.asset(
                          'assets/images/face.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  25.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                                    (route) => false);
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/icons/logout.png', scale: 4),
                              20.pw,
                              const Text(
                                'Log out',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )),
                      ElevatedButton(
                          onPressed: () {
                            buildShowDialog(context);
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/icons/upload.png', scale: 4),
                              20.pw,
                              const Text(
                                'Upload',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )),
                    ],
                  ),
                  20.ph ,
                  Expanded(
                    child: GridView.builder(
                      itemCount: 15,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,mainAxisSpacing: 5,
                          crossAxisCount: 3),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/sample.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
