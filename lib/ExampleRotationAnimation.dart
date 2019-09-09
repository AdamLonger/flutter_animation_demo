import 'package:flutter/material.dart';

import 'BaseAnimation.dart';
import 'dart:math';

class ExampleRotationAnimation extends BaseAnimation {
  ExampleRotationAnimation(Duration duration) : super(duration);

  @override
  Widget applyAnimation(AnimationController controller, Widget child) {
    return Transform.rotate(
      angle: controller.value * (2.0*pi)*2,
      child: child,
    );
  }
}
