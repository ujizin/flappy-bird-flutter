import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';

import '../game/flappy_bird.dart';

class Flappy extends Component with HasGameRef<FlappyBird> {
  Rect position;
  Sprite flappySprite;

  Flappy(Size screenSize) {
    position = Rect.fromLTWH(72, screenSize.height / 2, 64, 48);
    flappySprite = Sprite('flappy.png');
  }
  void move(double dx, double dy) {
    position = position.translate(0, -50);
  }

  @override
  void update(double t) {
    position = position.translate(0, t * 200);
  }

  @override
  void render(Canvas canvas) {
    flappySprite.renderRect(canvas, position);
  }
}
