import 'package:flappybird_usf/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _homeController.initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: _homeController.upBird,
          child: Container(
            color: Colors.white,
            child: Obx(() => Stack(children: [
                  Container(
                    color: Colors.blue,
                  ),
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      alignment: Alignment(
                          _homeController.positionsXaxis[0].value,
                          _homeController.positionsYaxisBarrierBottom[0].value),
                      child: SizedBox(
                        key: _homeController.keysTubos[0],
                        height: 540,
                        width: 150,
                        child: Image.asset(
                          'assets/images/tubo-bottom.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      alignment: Alignment(
                          _homeController.positionsXaxis[0].value,
                          _homeController.positionsYaxisBarrierTop[0].value),
                      child: SizedBox(
                        key: _homeController.keysTubos[1],
                        height: 540,
                        width: 150,
                        child: Image.asset(
                          'assets/images/tubo-top.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      alignment: Alignment(
                          _homeController.positionsXaxis[1].value,
                          _homeController.positionsYaxisBarrierBottom[1].value),
                      child: SizedBox(
                        key: _homeController.keysTubos[2],
                        height: 540,
                        width: 150,
                        child: Image.asset(
                          'assets/images/tubo-bottom.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      alignment: Alignment(
                          _homeController.positionsXaxis[1].value,
                          _homeController.positionsYaxisBarrierTop[1].value),
                      child: SizedBox(
                        key: _homeController.keysTubos[3],
                        height: 540,
                        width: 150,
                        child: Image.asset(
                          'assets/images/tubo-top.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    alignment:
                        Alignment(0, _homeController.positionTopBird.value),
                    child: Container(
                      key: _homeController.birdKey,
                      child: Image.asset(
                        'assets/images/bird.gif',
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 1,
                      bottom: 1,
                      child: Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.93),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                '00:${_homeController.secondsGame.value.toString().padLeft(2, '0')}'),
                          )))),
                  Obx(() => _homeController.gameOver.value == true
                      ? Center(
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.93),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('GAME OVER',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        'Time: 00:${_homeController.secondsGame.value.toString().padLeft(2, '0')}'),
                                    GestureDetector(
                                      onTap: _homeController.restartGame,
                                      child: const Text(
                                        'Restart game',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              )))
                      : Container()),
                ])),
          )),
    );
  }
}
