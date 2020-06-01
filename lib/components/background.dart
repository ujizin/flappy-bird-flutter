import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

import '../game/flappy_bird.dart';

class Background extends Component with HasGameRef<FlappyBird> {
  Sprite bgSprite;
  Rect bgRect;

  Background(Size screenSize) {
    bgSprite = Sprite('flappy_bird_background.png');
    var tileSize = screenSize.width / 9;
    bgRect = Rect.fromLTWH(
      0,
      screenSize.height - (tileSize * 23),
      tileSize * 9,
      tileSize * 23,
    );
  }

  @override
  void render(Canvas canvas) {
    bgSprite.renderRect(canvas, bgRect);
  }

  @override
  void update(double t) {}
}
