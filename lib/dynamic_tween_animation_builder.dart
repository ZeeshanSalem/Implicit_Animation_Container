import 'package:flutter/material.dart';

class OngoingAnimationByModifyingEndTweenValue extends StatefulWidget {
  @override
  _OngoingAnimationByModifyingEndTweenValueState createState() => _OngoingAnimationByModifyingEndTweenValueState();
}

class _OngoingAnimationByModifyingEndTweenValueState extends State<OngoingAnimationByModifyingEndTweenValue> {

  double _newValue = .1;
  Color _color = Colors.white;

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
              duration: Duration(milliseconds: 1),
              builder: (_ , Color color, Widget child){
                return ColorFiltered(
                    child: Image.asset("assets/star.png"),
                    colorFilter: ColorFilter.mode(color, BlendMode.modulate));
              }),
          Container(),
          Slider.adaptive(
              value: _newValue,
              onChanged: (double value){
                setState(() {
                  _newValue = value;
                  _color = Color.lerp(Colors.white, Colors.pink, value);
                });
              })


        ],
      ),
    );
  }
}
