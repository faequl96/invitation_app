import 'package:flutter/material.dart';

class LeftBackground extends StatelessWidget {
  const LeftBackground({
    super.key,
    required this.scrollValue,
    required this.flashValue,
  });

  final double scrollValue;
  final double flashValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            right: 0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/landing_bg_left.png"),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: size.width / 2,
            decoration: scrollValue > 1
                ? BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Colors.white.withOpacity(flashValue),
                        Colors.transparent.withOpacity(0),
                      ],
                    ),
                  )
                : null,
          ),
          const Positioned(
            right: -30,
            top: 60,
            child: Image(
              width: 140,
              fit: BoxFit.cover,
              image: AssetImage("assets/kelir_jawa_rose_gold.png"),
            ),
          ),
        ],
      ),
    );
  }
}
