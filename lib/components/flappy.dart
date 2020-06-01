import 'dart:ui';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_bird_flutter/base/base_component.dart';
import 'package:flappy_bird_flutter/components/pipe.dart';

import '../game/flappy_bird.dart';

class Flappy extends BaseComponent with HasGameRef<FlappyBird> {
  Rect position;
  Sprite flappySprite;

  final Function(bool) setGameOver;

  Flappy(Size screenSize, this.setGameOver) {
    position = Rect.fromLTWH(72, screenSize.height / 2, 64, 48);
    flappySprite = Sprite('flappy.png');
  }
  void move(double dx, double dy) {
    position = position.translate(0, -50);
  }

  @override
  void update(double t) {
    if (gameOver) return;

    position = position.translate(0, t * 200);

    gameRef.components.whereType<PipeComponent>().forEach((element) {
      if (element.position.overlaps(position)) {
        setGameOver(true);
      }
    });
  }

  @override
  void render(Canvas canvas) {
    flappySprite.renderRect(canvas, position);
  }
}
