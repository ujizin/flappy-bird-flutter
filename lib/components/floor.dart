import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';

import '../game/flappy_bird.dart';

class Floor extends AnimationComponent with HasGameRef<FlappyBird> {
  Sprite sprite;

  Floor(Size screenSize)
      : super(
          screenSize.width,
          200,
          Animation.sequenced(
            'floor.png',
            3,
            textureWidth: 300,
            textureHeight: 150,
          ),
        ) {
    x = 0;
    y = screenSize.height - 100;
  }

  @override
  void update(double t) {
    super.update(t);
    if (gameRef.gameOver) {
      this.clearEffects();
    } else {}
  }
}
