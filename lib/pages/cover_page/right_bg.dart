import 'package:flutter/material.dart';

class RightBackground extends StatelessWidget {
  const RightBackground({
    super.key,
    this.isTransparent,
    required this.scrollValue,
    required this.flashValue,
  });

  final bool? isTransparent;
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
              : Container(
                  height: double.maxFinite,
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
