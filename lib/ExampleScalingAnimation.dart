import 'package:flutter/material.dart';

import 'BaseAnimation.dart';
import 'dart:math';

class ExampleScalingAnimation extends BaseAnimation {
  ExampleScalingAnimation(Duration duration) : super(duration, isRepeating: true);

  @override
  Widget applyAnimation(AnimationController controller, Widget child) {
    return Transform.scale(
      scale: controller.value.toDouble()*1.5 + 0.5,
      child: child,
    );
  }
}
