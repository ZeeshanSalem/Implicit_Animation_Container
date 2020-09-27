import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: ImplicitContainer(),
    );
  }
}

class ImplicitContainer extends StatefulWidget {
  @override
  _ImplicitContainerState createState() => _ImplicitContainerState();
}

class _ImplicitContainerState extends State<ImplicitContainer> {

  bool _bigger = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        AnimatedContainer(
          width: _bigger ? 100 : 500,
          decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.purple, Colors.transparent],
              stops: [ _bigger ? 0.2 : 0.5, 1.0],
            ),
          ),
          curve: SineCurve(),
          child: Image.asset("assets/star.png"),
          duration: Duration( seconds: 1,),
        ),

        RaisedButton(
            onPressed: (){
              setState(() {
                _bigger = !_bigger;
              });
            },
          child: Text("Change Size"),
        ),

      ],
    );
  }
}

class SineCurve extends Curve {
  final double count;

  SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}
