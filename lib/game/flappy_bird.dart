import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flappy_bird_flutter/components/background.dart';
import 'package:flappy_bird_flutter/components/flappy.dart';
import 'package:flappy_bird_flutter/components/floor.dart';
import 'package:flutter/cupertino.dart';

class FlappyBird extends BaseGame with PanDetector {
  Flappy birdPlayer;

  Background background;

  Floor floor;

  Size screenSize;

  FlappyBird() {
    init();
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
    add(Background(screenSize));
    add(floor = Floor(screenSize));
    add(birdPlayer = Flappy(screenSize));
  }

  @override
  void onTapDown(int n, TapDownDetails delta) {
    var offset = delta.localPosition;
    birdPlayer.move(offset.dx, offset.dy);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
}
