import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class logout extends StatelessWidget {
  const logout({Key? key}) : super(key: key);

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
                onPressed: () {},
                child: Text(
                  "Sign out",
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
