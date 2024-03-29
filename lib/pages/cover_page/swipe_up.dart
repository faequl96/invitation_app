import 'dart:async';

import 'package:flutter/material.dart';

class SwipeUp extends StatefulWidget {
  const SwipeUp({super.key, required this.isOpenCompleted});

  final bool isOpenCompleted;

  @override
  State<SwipeUp> createState() => _SwipeUpState();
}

class _SwipeUpState extends State<SwipeUp> {
  late Timer _timer;

  double arrow1 = 26;
  double arrow2 = 40;

  bool isShowed = false;

  void periodic() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (timer.tick % 2 == 0) {
        arrow1 = 116;
        arrow2 = 130;
      } else {
        arrow1 = 26;
        arrow2 = 40;
        isShowed = !isShowed;
      }

      setState(() {});
    });
  }

  @override
  void initState() {
    periodic();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          isShowed
              ? AnimatedPositioned(
                  bottom: arrow1,
                  duration: const Duration(milliseconds: 1000),
                  child: const Center(
                    child: RotatedBox(
                      quarterTurns: 270 ~/ 6,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color.fromARGB(240, 255, 198, 192),
                        size: 32,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          isShowed
              ? AnimatedPositioned(
                  bottom: arrow2,
                  duration: const Duration(milliseconds: 1000),
                  child: const Center(
                    child: RotatedBox(
                      quarterTurns: 270 ~/ 6,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color.fromARGB(255, 230, 211, 164),
                        size: 32,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          const Positioned(
            bottom: 12,
            child: Text(
              "Geser ke atas",
              style: TextStyle(color: Color.fromARGB(255, 230, 211, 164)),
            ),
          ),
        ],
      ),
    );
  }
}
