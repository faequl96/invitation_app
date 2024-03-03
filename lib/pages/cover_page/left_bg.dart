import 'package:flutter/material.dart';

class LeftBackground extends StatelessWidget {
  const LeftBackground({
    super.key,
    this.isLightEffect,
    this.moveValue = 0,
    this.flashValue = 0,
    this.opacityValue = 0,
  });

  final bool? isLightEffect;
  final double moveValue;
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
                  right: 0,
                  bottom: 100,
                  child: Container(
                    height: 130,
                    width: size.width / 2 - 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomLeft: Radius.circular(14),
                      ),
                      color: Color.fromARGB(255, 230, 211, 164),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: Color.fromARGB(255, 255, 250, 230),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -1,
                  child: Container(
                    height: size.height,
                    width: size.width / 2,
                    decoration: moveValue > 1
                        ? BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white.withOpacity(flashValue),
                                Colors.transparent,
                              ],
                            ),
                          )
                        : null,
                  ),
                ),
                const Positioned(
                  right: -30,
                  bottom: 360,
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
