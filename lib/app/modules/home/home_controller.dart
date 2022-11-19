import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxDouble positionTopBird = (-1.0).obs;

  List<RxDouble> positionsXaxis = [(3.0).obs, (3.0 + 5.0).obs];
  List<RxDouble> positionsYaxisBarrierTop = [(2.5).obs, (2.5).obs];
  List<RxDouble> positionsYaxisBarrierBottom = [(-2.6).obs, (-2.6).obs];
  final birdKey = GlobalKey();
  final List<GlobalKey> keysTubos = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey()
  ];
  Random random = Random();
  RxBool gameOver = false.obs;
  RxInt secondsGame = 0.obs;

  Future<void> initGame() async {
    initTimer();
    while (!gameOver.value) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (positionTopBird < 1) {
        positionTopBird.value += 0.1;
        for (RxDouble element in positionsXaxis) {
          element.value -= 0.1;
          if (element.value < -5.0) {
            element.value = 5.0;
          }
          if (colisionBird()) {
            gameOver.value = true;
          }
        }
      } else {
        gameOver.value = true;
      }
    }
  }

  void initTimer() async {
    while (!gameOver.value) {
      secondsGame.value += 1;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> restartGame() async {
    positionTopBird.value = -1.0;
    positionsXaxis = [(3.0).obs, (3.0 + 5.0).obs];
    gameOver.value = false;
    secondsGame.value = 0;
    initGame();
  }

  Future<void> upBird() async {
    if (!gameOver.value) {
      positionTopBird.value -= 0.3;
    }
  }

  bool colisionBird() {
    bool birdColised = false;
    for (GlobalKey element in keysTubos) {
      RenderBox box1 = birdKey.currentContext!.findRenderObject() as RenderBox;
      RenderBox box2 = element.currentContext!.findRenderObject() as RenderBox;
      final size1 = box1.size;
      final size2 = box2.size;
      final position1 = box1.localToGlobal(Offset.zero);
      final position2 = box2.localToGlobal(Offset.zero);

      birdColised = (position1.dx < position2.dx + size2.width &&
          position1.dx + size1.width > position2.dx &&
          position1.dy < position2.dy + size2.height &&
          position1.dy + size1.height > position2.dy);
      if (birdColised) {
        break;
      }
      print(birdColised);
    }
    return birdColised;
  }
}
