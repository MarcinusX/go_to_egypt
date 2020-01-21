import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:go_to_egipt/entrance_fader.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Deligne',
        textTheme: TextTheme(body1: TextStyle(fontSize: 28)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color backgroundColor = Color.fromRGBO(216, 177, 136, 1);
Color darkerColor = Color.fromRGBO(200, 162, 122, 1);

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                'images/sky.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.2 * screenHeight,
            left: 0,
            right: 0,
            child: MainText(),
          ),
          Positioned(
            top: screenHeight * 0.55 - 0.65 * offset,
            right: 0,
            left: 0,
            height: screenHeight * 0.4,
            child: RepaintBoundary(
              child: Image.asset(
                'images/pyramid.png',
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.2),
              ),
            ),
          ),
          Header(),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: RepaintBoundary(
              child: Image.asset(
                'images/sand.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight * 0.2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 1],
                  colors: [backgroundColor.withOpacity(0), backgroundColor],
                ),
              ),
            ),
          ),
//              Positioned(
//                top: screenHeight * 0.95 - 1 * offset,
//                left: 0,
//                right: 0,
//                height: screenHeight / 3,
//                child: Container(
//                  height: screenHeight / 3,
//                  width: double.infinity,
//                  color: backgroundColor,
//                ),
//              ),
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: screenHeight),
                Container(
                  height: 100,
                  color: backgroundColor,
                ),
                Container(
                  color: backgroundColor,
                  child: Page1(),
                ),
                Page2(),
                Page3(),
                Container(
                  height: 100,
                  color: darkerColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        children: <Widget>[
          Text('GOTOEGYPT'),
          Spacer(),
          if (MediaQuery.of(context).size.width > 900) ...[
            Text('Home'),
            SizedBox(width: 32),
            Text('Explore'),
            SizedBox(width: 32),
            Text('Articles'),
            SizedBox(width: 32),
            Text('Galries'),
            SizedBox(width: 32),
            Text('Contact'),
            SizedBox(width: 64),
          ],
          Icon(
            Icons.apps,
            color: backgroundColor,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'THE ANCIENT WORLD',
          style: TextStyle(color: backgroundColor),
        ),
        SizedBox(height: 16),
        Container(
          height: 1,
          width: 64,
          color: backgroundColor,
        ),
        SizedBox(height: 32),
        Text(
          'Discover the awe-inspiring\nPyramids of Fize and ancient Egypt\'s',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 60 : 40,
          ),
        ),
        SizedBox(height: 32),
        RotatedBox(
          quarterTurns: 2,
          child: Icon(LineIcons.angle_double_up, color: Colors.grey),
        ),
        SizedBox(height: 16),
        Text('SCROLL DOWN', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: <Widget>[
          Text(
            'THE ANCIENT',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Egyptian',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                ' civilization',
                style: TextStyle(color: Colors.black, fontSize: 30),
              )
            ],
          ),
          SizedBox(height: height * 0.1),
          if (width > 440)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of yers. But what was its lasting impact?',
                  ),
                ),
                SizedBox(width: 64),
                Expanded(
                  child: Text(
                    'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics',
                  ),
                )
              ],
            )
          else ...[
            Text(
              'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of yers. But what was its lasting impact?',
            ),
            SizedBox(height: 16),
            Text(
              'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics',
            )
          ],
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: backgroundColor,
      height: height > width ? height * 0.5 : height * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.4,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: EntranceFader(
                offset: Offset(width / 4, 0),
                duration: Duration(seconds: 1),
                child: Text(
                  'CIVILIZATION',
                  style: TextStyle(
                    color: darkerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.4,
            child: Container(
              color: darkerColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              duration: Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/camel.png',
                    fit: BoxFit.fitWidth,
                  ),
                  Icon(
                    Icons.play_circle_outline,
                    size: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: darkerColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            Text('10 THINGS', style: TextStyle(color: Colors.black)),
            SizedBox(height: height * 0.05),
            _header(),
            SizedBox(height: height * 0.1),
            if (width > height)
              Row(
                children: <Widget>[
                  Expanded(child: _leftSide(width)),
                  SizedBox(width: width * 0.1),
                  Expanded(child: _rightSide(height, width))
                ],
              )
            else ...[
              _leftSide(width),
              _rightSide(height, width),
            ],
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  RichText _header() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontFamily: 'IbarraRealNova',
        ),
        children: [
          TextSpan(
            text: 'You probably didn\'t know\n',
          ),
          TextSpan(
            text: 'about ',
          ),
          TextSpan(
            text: 'ancient Egypt',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'IbarraRealNova',
            ),
          )
        ],
      ),
    );
  }

  Widget _rightSide(double height, double width) {
    return EntranceFader(
      offset: Offset(width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Container(
        height: height / 2,
        child: Stack(
          alignment: Alignment(0, 0.5),
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return Transform.rotate(
                  angle: _animationController.value * 0.5 * pi - pi * 0.7,
                  child: Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                );
              },
            ),
            Image.asset('images/pharaon.png'),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(double width) {
    return EntranceFader(
      offset: Offset(-width / 2, 0),
      delay: Duration(milliseconds: 1000),
      duration: Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'His original name was\nNot Tutankhamun',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Tutankhamun was originally named Tutanhaten. This name, whic literally means "living image of the Aten", reflected the fact that Tutankhaten\'s parents worshipped a sun god known as "the Aten". After a few years on the throne the young king.',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 32),
          Text(
            'Read More',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
