import 'dart:async';

import 'package:flutter/material.dart';
import 'BaseAnimation.dart';
import 'ControlledAnimation.dart';

class AnimationFrame extends StatefulWidget {
  final Widget animatableChild;
  final List<BaseAnimation> animationList;
  final bool simultaneous;
  final Stream<Object> parentCommandStream;

  static AnimationFrameState of(BuildContext context) =>
      (context.ancestorStateOfType(const TypeMatcher<AnimationFrameState>())
      as AnimationFrameState);

  const AnimationFrame(
      {Key key,
      this.animatableChild,
      this.parentCommandStream,
      this.simultaneous = true,
      this.animationList})
      : super(key: key);

  @override
  AnimationFrameState createState() => AnimationFrameState();
}

class AnimationFrameState extends State<AnimationFrame>
    with TickerProviderStateMixin {
  StreamSubscription childCommandSubscription;
  StreamSubscription parentCommandSubscription;
  List<ControlledAnimation> controlledAnimationList;

  @override
  void initState() {
    super.initState();

    parentCommandSubscription = widget.parentCommandStream.listen((object) {
      setState(() {
        executeAnimationCommand();
      });
    });

    controlledAnimationList = widget.animationList
        .map((animation) => ControlledAnimation(this, animation))
        .toList();

    controlledAnimationList.forEach((controlledAnimation) =>
        controlledAnimation.controller.addListener(() => setState(() {})));
  }

  void executeAnimationCommand() {
    if (controlledAnimationList.isNotEmpty) {
      if (!controlledAnimationList[0].controller.isAnimating) {
        controlledAnimationList.forEach((controlledAnimation) =>
            controlledAnimation.controller
                .repeat(reverse: controlledAnimation.animation.isRepeating));
      } else {
        controlledAnimationList.forEach(
            (controlledAnimation) => controlledAnimation.controller.reset());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.simultaneous) {
      return buildSimultaneous();
    } else {
      return buildSequential();
    }
  }

  Widget buildSimultaneous() {
    return controlledAnimationList.fold(widget.animatableChild,
        (previous, next) {
      return next.animation.applyAnimation(next.controller, previous);
    });
  }

  Widget buildSequential() {
    return Container(
      width: 20,
      height: 20,
      color: Colors.red,
    );
  }

  @override
  void dispose() {
    childCommandSubscription.cancel();
    parentCommandSubscription.cancel();
    controlledAnimationList.forEach((item) => item.dispose());
    super.dispose();
  }
}
