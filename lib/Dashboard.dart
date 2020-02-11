import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  String image;

  Dashboard(this.image);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final controller = PageController();
  AnimationController _controller;
  AnimationController _controllers;
  AnimationController _controllerss;
  AnimationController _controllersss;
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;
  Animation<Offset> _offsetAnimations;
  Animation<Offset> _offsetAnimationss;
  Animation<Offset> _offsetAnimationsss;
  Animation<Offset> _delayAnimation;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controllers = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controllerss = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controllersss = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetAnimations = Tween<Offset>(
      begin: Offset(-1, 0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllers,
      curve: Curves.easeOut,
    ));
    _offsetAnimationss = Tween<Offset>(
      begin: Offset(1, 0),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllerss,
      curve: Curves.easeOut,
    ));
    _offsetAnimationsss = Tween<Offset>(
      begin: Offset(0, -3),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllersss,
      curve: Curves.easeOut,
    ));
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controllers.forward(from: 0.0);
    _controllerss.forward(from: 0.0);
    _controllersss.forward(from: 0.0);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _delayAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _controller.forward(from: 0.0);

    Future.delayed(Duration(microseconds: 20), () {
      _animationController.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final List<NumbersModel> numbers = [
    NumbersModel(number: 1, id: 1),
    NumbersModel(number: 2, id: 2),
    NumbersModel(number: 3, id: 3),
    NumbersModel(number: 4, id: 4),
    NumbersModel(number: 5, id: 5),
    NumbersModel(number: 6, id: 6),
    NumbersModel(number: 7, id: 7),
    NumbersModel(number: 8, id: 8),
    NumbersModel(number: 9, id: 9)
  ];

  final List<String> _lest = [
    'My Dog',
    'Paris',
    'Our Wedding',
    'Meghan foxx',
    'Jacqueline Olly',
    'Meghan foxx',
    'Jacqueline Olly',
    'Andy Foxx',
    'Meghan foxx'
  ];

//  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 1.0,
//          color: Colors.white,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/2.jpg'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.white.withOpacity(0.20), BlendMode.dstATop),
              )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 30),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            print("ON TAp");
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/logo.png',scale: 1.5,

                          ),
                        ),
                        SizedBox(
                          width: 245,
                        ),
                        CircularProfileAvatar(
                          '',
                          child: Image.asset(
                            'assets/images/9.jpg',
                            scale: 22,
                            fit: BoxFit.fitWidth,
                          ),
                          borderColor: Colors.white,
                          borderWidth: 0,
                          elevation: 10,
                          radius: 18,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/images/menu.png',
                          scale: 18,
                          color: Colors.blueGrey[600],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 55),
                    child: Row(
                      children: <Widget>[
                        FadeTransition(
                          opacity: animation,
                          child: Column(
                            children: <Widget>[
                              Text(
                                '720',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'GilroySemiBold',
                                ),
                              ),
                              Text(
                                'Friends',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: 'GilroySemiBold',
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SlideTransition(
                          position: _offsetAnimationsss,
                          child: CircularProfileAvatar(
                            '',
                            child: Image.asset(
                              widget.image,
                              fit: BoxFit.cover,
                            ),
                            borderColor: Colors.white,
                            borderWidth: 0,
                            elevation: 2,
                            radius: 54,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        FadeTransition(
                          opacity: animation,
                          child: Column(
                            children: <Widget>[
                              Text(
                                '120',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'GilroySemiBold',
                                ),
                              ),
                              Text(
                                'Groups',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'GilroySemiBold',
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, left: 20),
                    child: Text(
                      'Jacqueline Olly',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.blueGrey[800],
                        fontFamily: 'GilroySemiBold',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: 'Journalist at ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'GilroySemiBold',
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Vogue',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 12,
                                      fontFamily: 'GilroySemiBold',
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 16,
                        ),
                        Text(
                          'Paris,France',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'GilroySemiBold',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      elevation: 40,
                      child: Container(
//                        decoration: BoxDecoration(
//                            border: Border(
//                          top: BorderSide(width: 1.0, color: Colors.black),
//                        )),
                        height: MediaQuery.of(context).size.height * 0.55,
//                      color: Colors.white,
                        width: MediaQuery.of(context).size.width * 1.0,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 38.0, right: 150),
                                child: Text(
                                  'Jacqueline\'s highlights',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: 'GilroySemiBold',
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: SlideTransition(
                                  position: _offsetAnimation,
                                  child: Container(
                                    //padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 40.0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: numbers.length,
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
//                                color: Colors.purple,
//                                gradient: new LinearGradient(
//                                    colors: [Colors.red, Colors.cyan],
//                                    begin: Alignment.centerRight,
//                                    end: new Alignment(-1.0, -1.0)
//                                ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/pictures/' +
                                                            (index + 1)
                                                                .toString() +
                                                            '.jpg',
                                                      ),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
//
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.white10,
                                                        Colors.blueAccent
                                                      ],
                                                      begin:
                                                          Alignment.centerRight,
                                                      end: Alignment(1.0, 1.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 28.0, bottom: 12),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text(
                                                    _lest[index],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontFamily:
                                                            'GilroySemiBold',
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              SlideTransition(
                                position: _delayAnimation,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, right: 190),
                                      child: Text(
                                        'Latest activity',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontFamily: 'GilroySemiBold',
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 35.0, top: 8),
                                      child: Row(
                                        children: <Widget>[
                                          CircularProfileAvatar(
                                            '',
                                            child: Image.asset(
                                              'assets/images/5.jpg',
                                              fit: BoxFit.fitWidth,
                                            ),
                                            borderColor: Colors.white,
                                            borderWidth: 0,
                                            elevation: 2,
                                            radius: 18,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                    text: '    Jacqueline',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blueAccent,
                                                        fontFamily:
                                                            'GilroySemiBold',
                                                        fontSize: 12),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            ' created new album',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'GilroySemiBold',
                                                            fontSize: 12),
                                                      ),
                                                      TextSpan(
                                                        text: ' Our Wedding.',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .blueAccent,
                                                            fontFamily:
                                                                'GilroySemiBold',
                                                            fontSize: 12),
                                                      )
                                                    ]),
                                              ),
                                              Text(
                                                '     Following  20:47 p.m.',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                    fontFamily:
                                                        'GilroySemiBold',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 38.0, left: 38, top: 10),
                                      child: Stack(children: <Widget>[
                                        FadeTransition(
                                          opacity: animation,
                                          child: Container(
                                            height: 180,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .8,
//                color: Colors.blue,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: new AssetImage(
                                                  "assets/pictures/3.jpg"),
                                              fit: BoxFit.fill,
                                            )),
                                          ),
                                        ),
                                        Container(
                                          height: 180,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .8,
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
                                      ]),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 330,
                    left: 66,
                    child: Row(
                      children: <Widget>[
                        SlideTransition(
                          position: _offsetAnimations,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Message",
                              style: TextStyle(
                                fontFamily: 'GilroySemiBold',
                              ),
                            ),
                            onPressed: () {},
                            color: Colors.blue[800],
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(50, 18, 50, 18),
                            splashColor: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SlideTransition(
                          position: _offsetAnimationss,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 45,
                                width: 55,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Image.asset(
                                      'assets/pictures/iconaccount.png'),
                                  onPressed: () {},
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 45,
                                width: 55,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                  color: Colors.white,
                                  splashColor: Colors.grey[900],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class NumbersModel {
  int number;
  int id;

  NumbersModel({this.number, this.id});
}
