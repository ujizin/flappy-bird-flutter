import 'dart:ui';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';
import 'package:flappy_bird_flutter/base/base_component.dart';
import 'package:flappy_bird_flutter/components/pipe.dart';

import '../game/flappy_bird.dart';

class PipeCreator extends BaseComponent with HasGameRef<FlappyBird> {
  Timer pipe;

  PipeCreator(Size screenSize) {
    pipe = Timer(1.5, repeat: true, callback: () {
      gameRef.add(PipeComponent(screenSize));
    });
    pipe.start();
  }

  @override
  void render(Canvas c) {}

  @override
  void update(double c) {
    if (gameOver) {
      pipe.stop();
      return;
    } else {
      if (!pipe.isRunning()) pipe.start();
    }

    pipe.update(c);
  }
}
