import 'package:flutter/material.dart';

class RightBackground extends StatelessWidget {
  const RightBackground({
    super.key,
    this.isLightEffect,
    this.isTransparent,
    this.moveValue = 0,
    this.flashValue = 0,
    this.opacityValue = 0,
  });

  final bool? isLightEffect;
  final bool? isTransparent;
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
                        left: -0.2,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/landing_bg_right.png"),
                        ),
                      ),
                isTransparent == true
                    ? const SizedBox.shrink()
                    : Positioned(
                        left: -0.3,
                        bottom: 100,
                        child: Container(
                          height: 130,
                          width: size.width / 2 - 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color.fromARGB(255, 244, 230, 194),
                                Color.fromARGB(255, 230, 211, 164),
                              ],
                              stops: [0.3, 0.5],
                            ),
                          ),
                        ),
                      ),
                isTransparent == true
                    ? const SizedBox.shrink()
                    : Positioned(
                        left: -0.3,
                        bottom: 100,
                        child: Container(
                          height: 130,
                          width: size.width / 2 - 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color.fromARGB(160, 255, 198, 192),
                                Color.fromARGB(160, 230, 211, 164),
                              ],
                              stops: [0.3, 0.5],
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 8,
                              top: 8,
                              bottom: 8,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 255, 250, 230),
                            ),
                          ),
                        ),
                      ),
                isTransparent == true
                    ? const SizedBox.shrink()
                    : Positioned(
                        left: -1,
                        child: Container(
                          height: size.height,
                          width: size.width / 2,
                          decoration: moveValue > 1
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(flashValue),
                                      Colors.transparent,
                                    ],
                                  ),
                                )
                              : null,
                        ),
                      ),
                isTransparent == true
                    ? const Positioned(
                        left: -30,
                        bottom: 346,
                        child: Image(
                          width: 134,
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
