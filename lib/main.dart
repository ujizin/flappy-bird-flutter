import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game/flappy_bird.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await  flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  
  FlappyBird flappyGame = FlappyBird();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = flappyGame.onTapDown;
  
  runApp(flappyGame.widget);
  
  flameUtil.addGestureRecognizer(tapper);
}