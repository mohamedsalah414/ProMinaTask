import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mygallery/modules/gallery/view/gallery_view.dart';
import 'package:mygallery/modules/login/repository/logIn_repo.dart';
import 'package:mygallery/modules/login/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final login = ChangeNotifierProvider((ref) {
  return LogIn();
});

class LogIn extends ChangeNotifier {
  final LoginRepo loginRepo = LoginRepo();

  void logIn(email, pass,BuildContext context) {
    loginRepo.login(email, pass).then((response){
      debugPrint('lpl1');
      if(response.statusCode==200&&json.decode(response.body)['error_message']==null){
        debugPrint('lpl2');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const GalleryPage(),
            ),
            (route) => false);
      }
      else if(json.decode(response.body)['error_message']!=null) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: json.decode(response.body)['error_message'].toString(),
          ),
        );
      }
    });
    notifyListeners();
  }

  void logout(BuildContext context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
            (route) => false);
    notifyListeners();
  }

}
