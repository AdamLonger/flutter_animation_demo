import 'package:flutte_sandbox/AnimationFrame.dart';
import 'package:flutter/material.dart';

class ExampleAnimatableButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.green,
      child: Text("Do It!"),
      onPressed: () {
        AnimationFrame.of(context).executeAnimationCommand();
      },
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
    );
  }
}
