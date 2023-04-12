import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mygallery/modules/gallery/model/gallery_model.dart';
import 'package:mygallery/utils/apiUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImagesRepo {

  Future<Gallery> getAllImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = 'Bearer ${prefs.getString('token')}';

    var response = await http.get(
      Uri.parse(baseUrl + myGallery),
      headers: {
        'Authorization' : token
      }
    );

    final body = json.decode(response.body);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    Map<String, dynamic> res = jsonDecode(response.body);
    if (response.statusCode == 200&&body['status']== "success") {
      debugPrint('getAllImages success');
      return Gallery.fromJson(res);

    }  else {
      debugPrint('getAllImages error');
      return Gallery.fromJson(res);
    }
  }
  Future<void> uploadImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = 'Bearer ${prefs.getString('token')}';

    var headers = {
      'Authorization':
      token
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + upload));
    request.files.add(await http.MultipartFile.fromPath('img',
        path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
    } else {
      debugPrint(response.reasonPhrase);
    }

  }

}