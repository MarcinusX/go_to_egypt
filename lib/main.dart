import 'package:flutter/material.dart';
import 'package:go_to_egipt/entrance_fader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'IbarraRealNova',
        textTheme: TextTheme(body1: TextStyle(fontSize: 24)),
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
  double screenHeight;
  double screenWidth;

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
    screenHeight ??= MediaQuery.of(context).size.height;
    screenWidth ??= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                'images/sky.jpg',
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
            top: screenHeight * 0.5 - 0.6 * offset,
            left: screenWidth * 0.3,
            right: screenWidth * 0.1,
            height: screenHeight * 0.4,
            child: RepaintBoundary(
              child: Image.asset(
                'images/pyramids.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Header(),
          Positioned(
            top: screenHeight * 0.7 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: RepaintBoundary(
              child: Image.asset(
                'images/sand.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.7 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: Container(
              height: screenHeight / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.8],
                  colors: [backgroundColor.withOpacity(0), backgroundColor],
                ),
              ),
            ),
          ),
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
                Container(
                  height: 1000,
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
//          SizedBox(width: 64),
          Text('GOTOEGYPT'),
          Spacer(),
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
          Icon(
            Icons.apps,
            color: backgroundColor,
            size: 32,
          ),
//          SizedBox(width: 64),
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
          style: TextStyle(fontSize: 60),
        ),
        SizedBox(height: 32),
        Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        Text('SCROLL DOWN', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 96),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of yers. But what was its lasting impact?',
//                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(width: 64),
              Expanded(
                child: Text(
                  'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics',
//                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
          SizedBox(height: 96),
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
      height: height * 0.8,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.2,
            height: height * 0.2,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: EntranceFader(
                offset: Offset(width / 4, 0),
                delay: Duration(seconds: 1),
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
            top: height * 0.4,
            height: height * 0.4,
            child: Container(
              color: darkerColor,
            ),
          ),
          Positioned(
            top: height * 0.05,
            left: width * 0.15,
            right: width * 0.15,
            bottom: width * 0.05,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              delay: Duration(seconds: 1),
              duration: Duration(seconds: 1),
              child: Image.asset(
                'images/camels.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
