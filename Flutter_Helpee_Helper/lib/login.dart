import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00bfa5),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 50,
                  color: Color(0xff5df2d6),
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                "HELPER",
                style: TextStyle(
                  fontSize: 63,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(width: 1, height: 250),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  minimumSize: Size(200, 45),
                  backgroundColor: Color(0xffe0f2f1),
                ),
                onPressed: signInWithGoogle,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 27,
                    color: Color(0xff008e76),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
