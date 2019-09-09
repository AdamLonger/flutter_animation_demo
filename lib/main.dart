import 'dart:async';

import 'package:flutter/material.dart';

import 'AnimationFrame.dart';
import 'ExampleAnimatable.dart';
import 'ExampleAnimatableButton.dart';
import 'ExampleHTranslationAnimation.dart';
import 'ExampleRotationAnimation.dart';
import 'ExampleScalingAnimation.dart';
import 'ExampleTranslationAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController animationCommandStream =
      StreamController<Object>.broadcast();

  void _startAnimation() {
    animationCommandStream.sink.add(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimationFrame(
          animatableChild: ExampleAnimatableButton(),
          animationList: [
            ExampleRotationAnimation(Duration(seconds: 2)),
            ExampleScalingAnimation(Duration(seconds: 1)),
            ExampleTranslationAnimation(Duration(seconds: 4)),
            ExampleHTranslationAnimation(Duration(seconds: 4))
          ],
          simultaneous: true,
          parentCommandStream: animationCommandStream.stream,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        tooltip: 'Start',
        child: Icon(Icons.play_circle_outline),
      ),
    );
  }

  @override
  void dispose() {
    animationCommandStream.close();
    super.dispose();
  }
}
