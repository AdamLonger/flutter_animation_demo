
import 'package:flutter/material.dart';

abstract class BaseAnimation {
  final Duration duration;
  final bool isRepeating;

  const BaseAnimation(this.duration, {this.isRepeating = false});

  Widget applyAnimation(AnimationController controller, Widget child);
}
