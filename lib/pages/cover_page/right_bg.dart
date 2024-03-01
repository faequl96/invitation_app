import 'package:flutter/material.dart';

class RightBackground extends StatelessWidget {
  const RightBackground({
    super.key,
    this.isLightEffect,
    this.isTransparent,
    this.scrollValue = 0,
    this.flashValue = 0,
    this.opacityValue = 0,
  });

  final bool? isLightEffect;
  final bool? isTransparent;
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
                  left: -2,
                  child: Container(
                    height: size.height,
                    width: size.width / 2,
                    color: Colors.white.withOpacity(opacityValue),
                  ),
                ),
              ]
            : [
                isTransparent == true
                    ? const SizedBox.shrink()
                    : const Positioned(
                        left: 0,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/landing_bg_right.png"),
                        ),
                      ),
                isTransparent == true
                    ? const SizedBox.shrink()
                    : Positioned(
                        left: -1,
                        child: Container(
                          height: size.height,
                          width: size.width / 2,
                          decoration: scrollValue > 1
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(flashValue),
                                      Colors.transparent.withOpacity(0),
                                    ],
                                  ),
                                )
                              : null,
                        ),
                      ),
                isTransparent == true
                    ? const Positioned(
                        left: -30,
                        top: 60,
                        child: Image(
                          width: 140,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/kelir_jawa_gold.png"),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
      ),
    );
  }
}
