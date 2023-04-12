import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mygallery/utils/apiUrl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginRepo {

  Future<http.Response> login(String email,String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse(baseUrl + logIn),
      body: ({
        'email': email,
        'password': pass,
      }),
    );

    final body = json.decode(response.body);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200&&body['error_message']==null) {
      debugPrint('success');
      prefs.setString('name', body['user']['name']);
      prefs.setString('email', body['user']['email']);
      prefs.setString('token', body['token']);

      return response;

    }  else {
      debugPrint('Error ${response.statusCode}');

      return response;
    }
  }
}