import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GoogleMaps_for_Helper.dart';
import 'login.dart';

class helper extends StatelessWidget {
  const helper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: First_Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xff00bfa5),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'WELCOME',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color(0xff5df2d6)),
            ),
            Text(
              'HELPER',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 64,
                  color: Color(0xffffffff)),
            ),
            const SizedBox(width: 20, height: 250),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(40)),
                  minimumSize: Size(150, 50),
                  backgroundColor: Color(0xffffebee)),
              onPressed: () {
                Get.to(NonWaiting_Page(), transition: Transition.leftToRight);
              },
              child: const Text('Sign in',
                  style: TextStyle(fontSize: 25, color: Color(0xff008e76))),
            ),
            const SizedBox(width: 10, height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(40)),
                  minimumSize: Size(150, 50),
                  backgroundColor: Color(0xffaebfbe)),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.to(Login(), transition: Transition.leftToRight);
                /*Get.to(
                  NonWaiting_Page(),
                  transition: Transition.downToUp
              );*/
              },
              child: const Text('Register',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class NonWaiting_Page extends StatefulWidget {
  const NonWaiting_Page({Key? key}) : super(key: key);

  _NonWaiting_Page createState() => _NonWaiting_Page();
}

class _NonWaiting_Page extends State<NonWaiting_Page> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xffaebfbe),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 240),
            Center(
              child: Container(
                height: 120,
                width: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'HELPER',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 64,
                          color: Color(0xffffffff)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20, height: 100),
            ElevatedButton(
                child: const Text('활성화',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffffffff))),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(40)),
                  minimumSize: Size(300, 80),
                  backgroundColor: Color(0xff00bfa5),
                ),
                onPressed: () => setState(() {
                      Get.to(Waiting_Page(),
                          transition: Transition.leftToRight);
                    })),
            const SizedBox(width: 20, height: 20),
            Center(
              child: const Text('활성화를 눌러 헬퍼가 되십시오',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff008e76))),
            ),
          ],
        ),
      ),
    );
  }
}

class Waiting_Page extends StatelessWidget {
  const Waiting_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    Timer(Duration(seconds: 1), () {
      Get.to(CalledbyHelpee_Page());
    });

    return Scaffold(
      backgroundColor: Color(0xff008e76),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 200),
            Center(
              child: Container(
                height: 250,
                width: 500,
                child: Column(
                  children: <Widget>[
                    Text(
                      'waiting',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Color(0xff5df2d6)),
                    ),
                    Text(
                      'HELPEE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 64,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(width: 20, height: 30),
                    Center(
                      child: const Text('헬퍼를 기다리는 중입니다...',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff5df2d6))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20, height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    //모서리를 둥글게
                    borderRadius: BorderRadius.circular(20)),
                minimumSize: Size(220, 45),
                backgroundColor: Color(0xffaebfbe),
              ),
              onPressed: () {
                Get.to(
                  NonWaiting_Page(),
                  transition: Transition.leftToRight,
                );
              },
              child: const Text('cancle',
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class CalledbyHelpee_Page extends StatefulWidget {
  const CalledbyHelpee_Page({Key? key}) : super(key: key);
  _CalledbyHelpee_Page createState() => _CalledbyHelpee_Page();
}

class _CalledbyHelpee_Page extends State<CalledbyHelpee_Page> {
  var opacityValue = 0.0;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xff5df2d6),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 40),
            Center(
              child: Container(
                height: 70,
                width: 200,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HELPER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xff00bfa5)),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20, height: 20),
            Container(
              height: 510,
              width: 500,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: <Widget>[
                  const SizedBox(width: 20, height: 20),
                  Container(
                    child: Text('위치: ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  const SizedBox(width: 20, height: 40),
                  ElevatedButton(
                      child: Text(
                        "지도로 보기",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            //모서리를 둥글게
                            borderRadius: BorderRadius.circular(30)),
                        minimumSize: Size(250, 60),
                        backgroundColor: Color(0xff00bfa5),
                      ),
                      onPressed: () => setState(() {
                            opacityValue = 1.0;
                            Get.to(
                              Detail_Page(),
                              transition: Transition.leftToRight,
                            );
                          })),
                  const SizedBox(width: 20, height: 40),
                  Container(
                    child: Text('시간: ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  const SizedBox(width: 20, height: 20),
                  Container(
                    child: Text('용건: ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ),
                  const SizedBox(width: 20, height: 140),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          child: Text(
                            "수락",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                //모서리를 둥글게
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size(120, 30),
                            backgroundColor: Color(0xff008e76),
                          ),
                          onPressed: () => setState(() {
                                opacityValue = 1.0;
                                Get.to(
                                  Accepted_Page(),
                                  transition: Transition.leftToRight,
                                );
                              })),
                      ElevatedButton(
                          child: Text("거절",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                //모서리를 둥글게
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size(120, 30),
                            backgroundColor: Color(0xffaebfbe),
                          ),
                          onPressed: () => setState(() {
                                opacityValue = 0.0;
                                Get.to(
                                  NonWaiting_Page(),
                                  transition: Transition.leftToRight,
                                );
                              })),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Detail_Page extends StatefulWidget {
  const Detail_Page({Key? key}) : super(key: key);
  _Detail_Page createState() => _Detail_Page();
}

class _Detail_Page extends State<Detail_Page> {
  double a = dgp_lati;
  double b = dgp_lgti;
  var opacityValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xff5df2d6),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 40),
            Center(
              child: Container(
                height: 70,
                width: 200,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HELPER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xff00bfa5)),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20, height: 20),
            Container(
              height: 300,
              width: 400,
              child: MapSample(),
            ),
            const SizedBox(width: 20, height: 50),
            ElevatedButton(
                child: Text("뒤로 가기",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => setState(() {
                      opacityValue = 0.0;
                      Get.to(
                        CalledbyHelpee_Page(),
                        transition: Transition.leftToRight,
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

class temp_Page extends StatefulWidget {
  const temp_Page({Key? key}) : super(key: key);
  _temp_Page createState() => _temp_Page();
}

class _temp_Page extends State<temp_Page> {
  double a = dgp_lati;
  double b = dgp_lgti;
  var opacityValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xff5df2d6),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 40),
            Center(
              child: Container(
                height: 70,
                width: 200,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HELPER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xff00bfa5)),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20, height: 20),
            Container(
              height: 300,
              width: 400,
              child: MapSample(),
            ),
            const SizedBox(width: 20, height: 50),
            ElevatedButton(
                child: Text("뒤로 가기",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(100, 50),
                  backgroundColor: Colors.white,
                ),
                onPressed: () => setState(() {
                      opacityValue = 0.0;
                      Get.to(
                        Accepted_Page(),
                        transition: Transition.leftToRight,
                      );
                    })),
          ],
        ),
      ),
    );
  }
}

class Accepted_Page extends StatefulWidget {
  const Accepted_Page({Key? key}) : super(key: key);
  _Accepted_Page createState() => _Accepted_Page();
}

class _Accepted_Page extends State<Accepted_Page> {
  double a = dgp_lati;
  double b = dgp_lgti;
  var opacityValue = 0.0;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xff008e76),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: 20, height: 40),
          Center(
            child: Container(
              height: 70,
              width: 200,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('HELPER',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xff00bfa5)),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20, height: 20),
          Container(
            height: 510,
            width: 500,
            decoration: new BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                const SizedBox(width: 20, height: 20),
                Container(
                  height: 250,
                  width: 350,
                  child: MapSample(),
                ),
                const SizedBox(width: 20, height: 10),
                ElevatedButton(
                    child: Text(
                      "자세히 보기",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //모서리를 둥글게
                          borderRadius: BorderRadius.circular(30)),
                      minimumSize: Size(150, 30),
                      backgroundColor: Color(0xff008e76),
                    ),
                    onPressed: () => setState(() {
                          opacityValue = 1.0;
                          Get.to(
                            temp_Page(),
                            transition: Transition.leftToRight,
                          );
                        })),
                Container(
                  child: Text('위치: ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ),
                const SizedBox(width: 20, height: 18),
                Container(
                  child: Text('시간: ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(width: 30, height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 200, height: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            //모서리를 둥글게
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(150, 50),
                        backgroundColor: Color(0xffaebfbe),
                      ),
                      onPressed: () {
                        Get.to(
                          NonWaiting_Page(),
                          transition: Transition.leftToRight,
                        );
                      },
                      child: const Text('취소',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
