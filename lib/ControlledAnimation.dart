
import 'package:flutter/material.dart';

import 'BaseAnimation.dart';

class ControlledAnimation{
  final BaseAnimation animation;
  AnimationController controller;

  ControlledAnimation(TickerProvider vsync, this.animation){
    controller = AnimationController(vsync: vsync, duration: animation.duration);
  }

  void dispose(){
    controller.dispose();
  }
}