
import 'package:flutter/material.dart';
import 'BaseAnimatable.dart';

class ExampleAnimatable extends BaseAnimatable {
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
