import 'package:flutter/material.dart';

import 'BaseAnimation.dart';
import 'dart:math';

class ExampleTranslationAnimation extends BaseAnimation {
  ExampleTranslationAnimation(Duration duration)
      : super(duration, isRepeating: true);

  @override
  Widget applyAnimation(AnimationController controller, Widget child) {
    return Transform.translate(
      offset: Offset(controller.value * 160 - 80, 0),
      child: child,
    );
  }
}
