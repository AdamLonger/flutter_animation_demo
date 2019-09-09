
import 'dart:async';

import 'package:flutter/material.dart';

class BaseAnimatable extends StatelessWidget{
  final Widget child;
  final _animationCommandStreamBuilder = StreamController<Object>();
  get animationCommandStream => _animationCommandStreamBuilder.stream;

  BaseAnimatable({Key key, this.child}) : super(key: key);

  void animate(){
    _animationCommandStreamBuilder.sink.add(true);
  }

  void dispose(){
    _animationCommandStreamBuilder.close();
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
