import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'modules/login/view/login_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
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
      home: const LoginPage(),
    );
  }
}
