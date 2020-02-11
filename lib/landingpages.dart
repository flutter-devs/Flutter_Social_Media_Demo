import 'dart:async';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebookap/Dashboard.dart';

class LandingPages extends StatefulWidget {
  @override
  _LandingPagesState createState() => _LandingPagesState();
}

class _LandingPagesState extends State<LandingPages>
    with TickerProviderStateMixin {
  final controller = PageController();
  AnimationController _controller;
  AnimationController _controllers;
  AnimationController _animationController;
  AnimationController _animationControllers;
  Animation<Offset> _offsetAnimation, _mainAnimation, _offsetAnimatio;
  Animation<Offset> _delayAnimation;
  Animation<Offset> _delayAnimations;
  bool showComment = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controllers = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationControllers = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _delayAnimation = Tween<Offset>(
      begin: Offset(.7, 0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _delayAnimations = Tween<Offset>(
      begin: Offset(0, .25),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationControllers,
      curve: Curves.ease,
    ));
    Future.delayed(Duration(microseconds: 150), () {
      _animationController.forward(from: 0.0);
    });
    Future.delayed(Duration(microseconds: 150), () {
      _animationControllers.forward(from: 0.0);
    });
    _offsetAnimatio = Tween<Offset>(
      begin: Offset(2, 0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllers,
      curve: Curves.easeOut,
    ));
    _mainAnimation = Tween<Offset>(
      begin: Offset(10, 0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward(from: 0.0);
    _controllers.forward(from: 0.0);
//    Future.delayed(Duration(seconds: 2),(){
////      _anothercontroller.forward(fr)
//    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final List<NumbersModel> numbers = [
    NumbersModel(number: 1, id: 1, image: 'assets/images/1.jpg'),
    NumbersModel(number: 2, id: 2, image: 'assets/images/2.jpg'),
    NumbersModel(number: 3, id: 3, image: 'assets/images/3.jpg'),
    NumbersModel(number: 4, id: 4, image: 'assets/images/4.jpg'),
    NumbersModel(number: 5, id: 5, image: 'assets/images/5.jpg'),
    NumbersModel(number: 6, id: 6, image: 'assets/images/6.jpg'),
    NumbersModel(number: 7, id: 7, image: 'assets/images/7.jpg'),
    NumbersModel(number: 8, id: 8, image: 'assets/images/8.jpg'),
    NumbersModel(number: 9, id: 9, image: 'assets/images/9.jpg')
  ];
  final List<String> _lest = [
    '+ Add Story',
    'Jacque Olly',
    'Andy Foxx',
    'Meghan foxx',
    'Jacqueline Olly',
    'Meghan foxx',
    'Jacqueline Olly',
    'Andy Foxx',
    'Meghan foxx'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: 'MAIN',
                        child: SizedBox(
                          width: 40,
                          child: Image.asset('assets/logo.png',
                              fit: BoxFit.scaleDown, ),
                        ),
                      ),
                      SlideTransition(
                        position: _mainAnimation,
                        child: Row(
                          children: <Widget>[
                            CircularProfileAvatar(
                              '',
                              child: Image.asset(
                                'assets/images/5.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderColor: Colors.white,
                              borderWidth: 0,
                              elevation: 2,
                              radius: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.dehaze,
                              size: 30,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: Text(
                      'Hello, Anna!',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'GilroySemiBold',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48),
                  child: SlideTransition(
                    position: _offsetAnimatio,
                    child: Container(
                      child: Material(
                        elevation: 20,
                        shadowColor: Colors.white,
                        child: TextFormField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  What's on your mind?",
                          hintStyle: TextStyle(
                            fontFamily: 'GilroySemiBold',
                          ),
                          suffixIcon: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),

//                            border: OutlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Colors.transparent,
//                                  width: 10,
//                                ),
//                                borderRadius: BorderRadius.circular(5),
//                                gapPadding: 10),

                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(5),
                              gapPadding: 10),
                        )),
                      ),
                    ),
                  ),
                ),
//SizedBox(height: 170,),
                SlideTransition(
                  position: _offsetAnimatio,
                  child: Container(
                    //padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 40.0),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    height: MediaQuery.of(context).size.height / 5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: numbers.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print("ON TAp");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Dashboard(numbers[index].image);
                              }));
                            },
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.7,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: AssetImage(numbers[index].image),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.7,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
//
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white10,
                                          Colors.blueAccent
                                        ],
                                        begin: Alignment.centerRight,
                                        end: Alignment(0.8, 0.9)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18.0, bottom: 6),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      _lest[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'GilroySemiBold',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SlideTransition(
                  position: _delayAnimation,
                  child: TabBar(
                    labelStyle: TextStyle(
                      fontFamily: 'GilroySemiBold',
                    ),
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: Colors.blue[800],
                    indicatorWeight: 4.5,
                    indicatorPadding: EdgeInsets.only(right: 70, left: 20),
                    tabs: <Widget>[
                      Tab(
                        text: ('Your News Feed'),
                      ),
                      Tab(
                        text: "People you may know",
                      ),
                      Tab(
                        text: "Friends",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SlideTransition(
                  position: _delayAnimations,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 42.0),
                        child: Row(
                          children: <Widget>[
                            CircularProfileAvatar(
                              '',
                              child: Image.asset(
                                'assets/images/5.jpg',
                                fit: BoxFit.cover,
                              ),
                              borderColor: Colors.white,
                              borderWidth: 0,
                              elevation: 2,
                              radius: 18,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                      text: '  Lisa Haywire',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 14,
                                        fontFamily: 'GilroySemiBold',
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '  updated her cover photo.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'GilroySemiBold',
                                          ),
                                        )
                                      ]),
                                ),
                                Text(
                                  '  Following  20:47',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: 'GilroySemiBold',
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 38.0, left: 38, top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(children: <Widget>[
                            Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width * .8,
//                color: Colors.blue,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: new AssetImage("assets/images/12.jpg"),
                                fit: BoxFit.fill,
                              )),
                            ),
                            Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width * .8,
//                color: Colors.blue,
                              decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                    colors: [Colors.white10, Colors.blueAccent],
                                    begin: Alignment.centerRight,
                                    end: Alignment(1.0, 1.0)),
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '              💖 Andrew & 124 others       ',
                              style: TextStyle(fontSize: 13),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showComment = !showComment;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.comment,
                                  size: 16
                                  ,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showComment = !showComment;
                                });
                              },
                              child: Text(
                                ' 21 comments',
                                style: TextStyle(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                      showComment
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  top: 18.0, right: 30, left: 30),
                              child: Container(
                                height: 40,
                                child: Material(
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Write a Comment! ",
                                    hintStyle: TextStyle(
                                      fontFamily: 'GilroySemiBold',
                                    ),
                                    suffixIcon: Icon(
                                      Icons.create,
                                      color: Colors.blue,
                                    ),

//                            border: OutlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Colors.transparent,
//                                  width: 10,
//                                ),
//                                borderRadius: BorderRadius.circular(5),
//                                gapPadding: 10),

                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 10,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        gapPadding: 10),
                                  )),
                                ),
                              ),
                            )
                          : SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 5),
                        child: Row(
                          children: <Widget>[
                            CircularProfileAvatar(
                              '',
                              child: Image.asset(
                                'assets/images/8.jpg',
                                fit: BoxFit.fitHeight,
                              ),
                              borderColor: Colors.white,
                              borderWidth: 0,
                              elevation: 2,
                              radius: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                      text: '  Jacque Roy ',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontFamily: 'GilroySemiBold',
                                          fontSize: 12),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' created new album',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'GilroySemiBold',
                                              fontSize: 10),
                                        ),
                                        TextSpan(
                                          text: ' Our Wedding.',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontFamily: 'GilroySemiBold',
                                              fontSize: 11),
                                        )
                                      ]),
                                ),
                                Text(
                                  '   Following  20:47',
                                  style: TextStyle( fontFamily: 'GilroySemiBold',
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 38.0, left: 38, top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width * .8,
//                color: Colors.blue,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: new AssetImage("assets/images/33.jpg"),
                                  fit: BoxFit.fill,
                                )),
                              ),
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width * .8,
//                color: Colors.blue,
                                decoration: BoxDecoration(
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.white10,
                                        Colors.blueAccent
                                      ],
                                      begin: Alignment.centerRight,
                                      end: Alignment(1.0, 1.0)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumbersModel {
  int number;
  int id;
  String image;

  NumbersModel({this.number, this.id, this.image});
}
