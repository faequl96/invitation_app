import 'package:flutter/material.dart';
import 'package:invitation_app/enum/enums.dart';
import 'package:invitation_app/methods/methods.dart';

class LeftBackground extends StatelessWidget {
  const LeftBackground({
    super.key,
    required this.hType,
    required this.wType,
    required this.backgroundType,
    this.isLightEffect,
    this.moveValue = 0,
    this.flashValue = 0,
    this.opacityValue = 0,
  });

  final H hType;
  final W wType;
  final BackgroundType backgroundType;
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
                Positioned(
                  right: -0.2,
                  child: Image(
                    fit: BoxFit.cover,
                    width: size.width / 2,
                    image: const AssetImage("assets/landing_bg_left.png"),
                  ),
                ),
                backgroundType == BackgroundType.Cover
                    ? Positioned(
                        right: -1,
                        bottom: h(hType, 76, 84, 92, 100),
                        child: Container(
                          height: h(hType, 112, 118, 124, 130),
                          width: size.width / 2 - w(wType, 34, 36, 38, 40),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(210, 255, 198, 192),
                                Color.fromARGB(210, 230, 211, 164),
                              ],
                              stops: [0.3, 0.5],
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 8,
                              top: 8,
                              bottom: 8,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              color: Color.fromARGB(255, 255, 250, 230),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
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
                backgroundType == BackgroundType.Cover
                    ? Positioned(
                        right: -w(wType, 24, 26, 28, 30),
                        bottom: h(hType, 298, 314, 330, 346),
                        child: Image(
                          width: h(hType, 116, 122, 128, 134),
                          fit: BoxFit.cover,
                          image: const AssetImage(
                            "assets/kelir_jawa_rose_gold.png",
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
      ),
    );
  }
}
