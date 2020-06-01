import 'dart:ui';

import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flappy_bird_flutter/base/base_component.dart';
import 'package:flappy_bird_flutter/components/background.dart';
import 'package:flappy_bird_flutter/components/flappy.dart';
import 'package:flappy_bird_flutter/components/floor.dart';
import 'package:flappy_bird_flutter/components/pipe_creator.dart';
import 'package:flutter/cupertino.dart';

class FlappyBird extends BaseGame with PanDetector, HasGameRef<FlappyBird> {
  Flappy birdPlayer;

  Background background;

  Floor floor;

  Size screenSize;

  bool gameOver = false;

  PipeCreator pipes;

  FlappyBird() {
    init();
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
    add(Background(screenSize));
    add(floor = Floor(screenSize));
    add(pipes = PipeCreator(screenSize));
    add(birdPlayer = Flappy(screenSize, setGameOver));
  }

  void setGameOver(bool isGameOver) {
    gameRef.components.whereType<BaseComponent>().forEach((element) {
      element.gameOver = isGameOver;
    });
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
