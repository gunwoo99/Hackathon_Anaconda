import 'package:firebase_auth/firebase_auth.dart';
import 'logout.dart';
import 'helper_app.dart';
import 'helpee_app.dart';
import 'login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          return const helper();
        } else {
          return const Login();
        }
      },
    );
  }
}
