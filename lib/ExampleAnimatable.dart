
import 'package:flutter/material.dart';

class ExampleAnimatable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FittedBox(
        fit: BoxFit.fill,
        child: new Icon(Icons.rotate_right),
      ),
      width: 50,
      height: 50,
    );
  }
}
