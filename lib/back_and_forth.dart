import 'package:flutter/material.dart';

class BackAndForth extends StatefulWidget {
  @override
  _BackAndForthState createState() => _BackAndForthState();
}

class _BackAndForthState extends State<BackAndForth> {


  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //alignment: Alignment.center,
        children: [

          TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.white, end: _color),
              duration: Duration(seconds: 1),
              onEnd: (){
                setState(() {
                  _color = _color == Colors.red ? Colors.white : Colors.red;
                });
              },
              builder: (_ , Color color, Widget child){
                return ColorFiltered(
                    child: Image.asset("assets/star.png"),
                    colorFilter: ColorFilter.mode(color, BlendMode.modulate));
              }),



        ],
      ),
    );
  }
}
