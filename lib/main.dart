import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_facebookap/Dashboard.dart';

import 'package:flutter_facebookap/landingpages.dart';
import 'package:flutter_facebookap/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen());

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  double x = 0.0, y = 0.0;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 01),()=>   Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(microseconds: 1


            ),
            pageBuilder: (_, __, ___) => LandingPages())),
    );
    animationController =
        AnimationController(duration:  Duration(milliseconds: 300), vsync: this);
    animation = Tween<double>(begin: 0, end: 0.8).animate(animationController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
          x = - animation.value - 0.1;
          y = - animation.value;
        });
      });
    animationController.forward();

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(width: size.width, height: size.height ,color: Color(0xff3A559F)),
          Align(
            alignment: Alignment(x-0.1, y-0.05),
            child: Transform.scale(
              scale: 1.4 - animation.value,
              child: Hero(
                tag:'MAIN',
                child: SizedBox(width: 100,
                    child: Image.asset('assets/logo.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
