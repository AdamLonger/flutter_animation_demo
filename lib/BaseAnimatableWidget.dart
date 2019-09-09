
import 'package:flutter/material.dart';

class BaseAnimatableWidget extends StatelessWidget {
  final Widget child;

  const BaseAnimatableWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
