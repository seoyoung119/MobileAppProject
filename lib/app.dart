import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_cardmap/addCard.dart';
import 'package:project_cardmap/cardSwipe.dart';
import 'package:project_cardmap/login.dart';
import 'package:project_cardmap/home.dart';

class CardMapp extends StatelessWidget {
  const CardMapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CardMap',
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/login' : '/',
      routes: {
        '/add': (BuildContext context) => const AddPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/cardSwipe': (BuildContext context) => const cardSwipePage(
              title: "Card Selection",
            ),
        '/': (BuildContext context) => const HomePage(),
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
