import 'package:flutter/material.dart';

class LeftBackground extends StatelessWidget {
  const LeftBackground({
    super.key,
    this.isLightEffect,
    this.scrollValue = 0,
    this.flashValue = 0,
    this.opacityValue = 0,
  });

  final bool? isLightEffect;
  final double scrollValue;
  final double flashValue;
  final double opacityValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width / 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: isLightEffect == true
            ? [
                Positioned(
                  right: -2,
                  child: Container(
                    height: size.height,
                    width: size.width / 2,
                    color: Colors.white.withOpacity(opacityValue),
                  ),
                ),
              ]
            : [
                const Positioned(
                  right: -0.1,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/landing_bg_left.png"),
                  ),
                ),
                Positioned(
                  right: -1,
                  child: Container(
                    height: size.height,
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
