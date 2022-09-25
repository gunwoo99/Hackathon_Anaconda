import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start/login.dart';
import 'GoogleMaps_for_Helpee.dart';

String latiText = '0';
String lgtiText = '0';

class helpee extends StatelessWidget {
  const helpee({Key? key}) : super(key: key);

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
      backgroundColor: Color(0xffef9a9a),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'WELCOME',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color(0xffffcccb)),
            ),
            Text(
              'HELPEE',
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
                  style: TextStyle(fontSize: 25, color: Color(0xffba6b6c))),
            ),
            const SizedBox(width: 10, height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(40)),
                  minimumSize: Size(150, 50),
                  backgroundColor: Color(0xffccb9bc)),
              onPressed: () {
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
  var opacityValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: Color(0xffba6b6c),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 50),
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
                    Text('HELPEE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xffba6b6c)),
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20, height: 25),
            Container(
              child: Container(
                height: 500,
                width: 500,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    const SizedBox(width: 20, height: 25),
                    Text('위치',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.left),
                    const SizedBox(width: 20, height: 10),
                    Container(
                      width: 350,
                      child: TextField(
                          onChanged: (text) {
                            setState(() {
                              latiText = "";
                              latiText = text;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '위도 입력',
                          )),
                    ),
                    const SizedBox(width: 20, height: 1),
                    Container(
                      width: 350,
                      child: TextField(
                          onChanged: (text) {
                            setState(() {
                              lgtiText = "";
                              lgtiText = text;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '경도 입력',
                          )),
                    ),
                    const SizedBox(width: 20, height: 40),
                    AnimatedOpacity(
                      opacity: opacityValue,
                      duration: Duration(seconds: 1),
                      child: Text('위치 정보를 입력해주세요.\n',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                          textAlign: TextAlign.center),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            child: const Text('접수',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffffffff))),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  //모서리를 둥글게
                                  borderRadius: BorderRadius.circular(40)),
                              minimumSize: Size(300, 80),
                              backgroundColor: Color(0xffef9a9a),
                            ),
                            onPressed: () => setState(() {
                                  if (latiText != '0' && lgtiText != '0') {
                                    Get.to(Waiting_Page(),
                                        transition: Transition.leftToRight);
                                  } else {
                                    opacityValue = 1.0;
                                  }
                                })),
                      ],
                    ),
                  ],
                ),
              ),
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
      Get.to(FoundedHelper_Page());
    });

    return Scaffold(
      backgroundColor: Color(0xffba6b6c),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20, height: 200),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'finding',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Color(0xffffcccb)),
                  ),
                  Text(
                    'HELPER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 64,
                        color: Color(0xffffffff)),
                  ),
                  const SizedBox(width: 20, height: 30),
                  Text(
                    '주위를 헬퍼를 찾는중입니다...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xffffcccb)),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20, height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    //모서리를 둥글게
                    borderRadius: BorderRadius.circular(20)),
                minimumSize: Size(220, 45),
                backgroundColor: Color(0xffccb9bc),
              ),
              onPressed: () {
                Get.to(
                  NonWaiting_Page(),
                  transition: Transition.leftToRight,
                );
              },
              child: const Text('cancle',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
            const SizedBox(width: 20, height: 20),
          ],
        ),
      ),
    );
  }
}

class FoundedHelper_Page extends StatefulWidget {
  const FoundedHelper_Page({Key? key}) : super(key: key);
  _FoundedHelper_Page createState() => _FoundedHelper_Page();
}

class _FoundedHelper_Page extends State<FoundedHelper_Page> {
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
      backgroundColor: Color(0xffffcccb),
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
                  Text('HELPEE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xffef9a9a)),
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
                const SizedBox(width: 20, height: 30),
                Center(
                  child: Text('헬퍼 수락 완료',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffba6b6c))),
                ),
                const SizedBox(width: 20, height: 18),
                Container(
                  child: Text('거리: 000km ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(width: 30, height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            //모서리를 둥글게
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(150, 50),
                        backgroundColor: Color(0xffba6b6c),
                      ),
                      onPressed: () {
                        Get.to(
                          NonWaiting_Page(),
                          transition: Transition.leftToRight,
                        );
                      },
                      child: const Text('진행',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    const SizedBox(width: 30, height: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            //모서리를 둥글게
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: Size(150, 50),
                        backgroundColor: Color(0xffccb9bc),
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
