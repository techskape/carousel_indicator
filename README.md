# carousel_indicator

A Minimal and Simple carousel indicator library.

# Author

Tech Skape (Love K.) techskape@gmail.com

# Screenshot

![showcases](https://github.com/techskape/carousel_indicator/blob/master/screenshots/2020-08-06-18-48-46.gif)

## Example
```
import 'package:carousel_indicator/carousel_indicator.dart';
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
      
        primarySwatch: Colors.blue,
      
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
 int pageIndex=0;

  List<Widget> _demo=[
    Container(height: 300,color: Colors.amber),
              Container(height: 300,color: Colors.black),
              Container(height: 300,color: Colors.blue),
              Container(height: 300,color: Colors.green),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: PageView(
            children: _demo,
            
            onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                });
            },
          ),
        ),
        SizedBox(height: 40,),
        CarouselIndicator(
          count: _demo.length,
          index: pageIndex,
        ),
      ],
    );
  }
}
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
