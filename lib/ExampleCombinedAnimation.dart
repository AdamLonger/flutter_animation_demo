import 'package:flutter/material.dart';

import 'BaseAnimation.dart';
import 'dart:math';

class ExampleCombinedAnimation extends BaseAnimation {
  ExampleCombinedAnimation(Duration duration) : super(duration);

  @override
  Widget applyAnimation(AnimationController controller, Widget child) {
    return Transform.scale(
      scale: controller.value.toDouble() + 1,
      child: Transform.rotate(
        angle: controller.value * 360.0/ 2.0 / (2.0*pi),
        child: child,
      ),
    );
  }
}
