import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trippi_app/views/authentication/check_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 7);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => CheckAuth()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 200,
              child: Image.asset("assets/logo1.png"),
            ),
            //  Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Always Take The Scenic Road",
              style: TextStyle(fontSize: 22.0, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 4,
            )
          ],
        ),
      ),
    );
  }
}
