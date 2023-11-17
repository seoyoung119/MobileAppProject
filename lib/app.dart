import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_cardmap/login.dart';

class CardMapp extends StatelessWidget {
  const CardMapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CardMap',
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/',
      routes: {
        // '/add': (BuildContext context) => const AddPage(),
        '/login': (BuildContext context) => const LoginPage(),
        // '/': (BuildContext context) => HomePage(),
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}