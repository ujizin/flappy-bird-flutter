import 'dart:math';
import 'dart:ui';

import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';
import 'package:flappy_bird_flutter/base/base_component.dart';

import '../game/flappy_bird.dart';

class PipeComponent extends BaseComponent with HasGameRef<FlappyBird> {
  Sprite pipe;
  Rect position;
  Random random = Random();
  bool _destroy = false;

  PipeComponent(Size screenSize) {
    pipe = Sprite('pipe.png');
    position = Rect.fromLTWH(
      screenSize.width + 100,
      0,
      100,
      screenSize.height - 100,
    );
  }

  @override
  void render(Canvas canvas) {
    pipe.renderRect(canvas, position);
  }

  @override
  void update(double t) {
    if (position.width < 0) {
      _destroy = true;
    } else {
      if (!gameOver) position = position.translate(-(t * 150), 0);
    }
  }

  @override
  bool destroy() => _destroy;
}
