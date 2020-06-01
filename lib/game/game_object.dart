import 'package:flutter/material.dart';

class GameObject {
  Rect position;

  Paint _white = Paint()..color = Color(0xFFFFFFFF);
 
  void render(Canvas canvas) {
    canvas.drawRect(position, _white);
  }
}