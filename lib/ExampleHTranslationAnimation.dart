import 'package:flutter/material.dart';

import 'BaseAnimation.dart';
import 'dart:math';

class ExampleHTranslationAnimation extends BaseAnimation {
  ExampleHTranslationAnimation(Duration duration) : super(duration, isRepeating: false );

  @override
  Widget applyAnimation(AnimationController controller, Widget child) {
    return Transform.translate(
      offset: Offset(0, controller.value * 160 - 80),
      child: child,
    );
  }
}
