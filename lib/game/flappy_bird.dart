import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flappy_bird_flutter/game/game_object.dart';
import 'package:flutter/cupertino.dart';

class FlappyBird extends Game {
  
  GameObject birdPlayer;
  Size screenSize;

  FlappyBird() {
    birdPlayer = GameObject()..position = Rect.fromLTWH(100, 100, 50, 50);

  }

  void onTapDown(TapDownDetails delta) {
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    birdPlayer?.render(canvas);
  }

  @override
  void update(double delta) {
  }


}