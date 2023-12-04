import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_cardmap/auth.dart';
import 'package:project_cardmap/components/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                imagePath: 'assets/google.png',
                onTap: () async {
                  await Auth().signInWithGoogle();

                  final userDocRef = FirebaseFirestore.instance
                      .collection('user')
                      .doc(FirebaseAuth.instance.currentUser!.uid);

                  final doc = await userDocRef.get();

                  if (!doc.exists) {
                    List list = <String>['null'];
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      'name': FirebaseAuth.instance.currentUser!.displayName,
                      'cardList': list,
                    });

                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/cardSwipe');
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/cardSwipe');
                  }
                },
                text: 'Sign in with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
