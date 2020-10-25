import 'package:flutter/material.dart';
class SuperBasic extends StatefulWidget {
  @override
  _SuperBasicState createState() => _SuperBasicState();
}

class _SuperBasicState extends State<SuperBasic> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Center(
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: Colors.purple, end: Colors.orange),
            duration: Duration(seconds: 2),
            builder: (BuildContext context,  Color color, Widget child){
              return ColorFiltered(
                child:Image.asset("assets/star.png"),
                colorFilter: ColorFilter.mode(color, BlendMode.modulate),
              );
            },
          ),
        )
      ],
    );
  }
}
