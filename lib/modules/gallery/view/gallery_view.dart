import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mygallery/modules/gallery/model/gallery_model.dart';
import 'package:mygallery/modules/gallery/view/widgets/dialog.dart';
import 'package:mygallery/modules/gallery/viewmodel/gallery.dart';
import 'package:mygallery/modules/login/view/login_view.dart';
import 'package:mygallery/modules/login/viewmodel/login.dart';

class GalleryPage extends ConsumerStatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.watch(image).init();
    });
    ref.read(login);
    ref.read(image);
  }

  @override
  Widget build(BuildContext context) {
    final log = ref.watch(login);
    final img = ref.watch(image);
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
                            log.logout(context);
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
                            buildShowDialog(context).then((value) {
                              ref.refresh(image).init();
                            });
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
                  20.ph,
                  RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(image).init();
                    },
                    child: FutureBuilder<Gallery>(
                        future: img.futureImages,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              snapshot.connectionState ==
                                  ConnectionState.active) {
                            if (snapshot.hasData) {
                              return Expanded(
                                child: GridView.builder(
                                  itemCount: snapshot.data!.data.images.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          crossAxisCount: 3),
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        snapshot.data!.data.images[index],
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress != null) {
                                            print(loadingProgress
                                                .cumulativeBytesLoaded);
                                            return Center(
                                              child: CircularProgressIndicator(
                                                  value: loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!),
                                            );
                                          }
                                          return child;
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (!(snapshot.hasData)) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              debugPrint('${snapshot.error}');
                              return const Center(
                                child: Text('Error'),
                              );
                            } else {
                              debugPrint('${snapshot.error}');
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          } else {
                            return const Center(
                              child: Text('No Internet'),
                            );
                          }
                        }),
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
