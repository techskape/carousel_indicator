import 'package:carousel_slider/carousel_slider.dart';
import 'package:carouselindicator/carousel_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _carouselController = CarouselController();
  int updatedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 300,
          child: CarouselSlider(
              items: [
                Container(
                  height: 300,
                  color: Colors.amber,
                ),
                Container(
                  height: 300,
                  color: Colors.pink,
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  height: 300,
                  color: Colors.green,
                ),
              ],
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  onPageChanged: (index, _) {
                  setState(() {
                    updatedIndex=index;
                  });
                  }),
              carouselController: _carouselController),
        ),
        SizedBox(height: 40),
        CarouselIndicator(
          count: 4,
          //controller: _pageController,
          width: 46,
          height: 4,
          space: 6,
          index: updatedIndex,
          activeColor: Colors.green,
          cornerRadius: 6,
        ),
      ],
    );
  }
}
