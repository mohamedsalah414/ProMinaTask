import 'package:flutter/material.dart';

import 'view/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Mina Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'segui',
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
