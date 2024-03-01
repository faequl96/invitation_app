import 'dart:ui';

import 'package:flutter/material.dart';

class SealInvitation extends StatelessWidget {
  const SealInvitation({super.key, required this.isSealOpened});

  final bool isSealOpened;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      height: size.height,
      width: size.width,
      child: Align(
        alignment: Alignment.center,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              height: double.maxFinite,
              width: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.grey.shade600.withOpacity(0.08),
                    Colors.white.withOpacity(0.08),
                  ],
                  stops: const [0.4, 0.6, 1],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: isSealOpened ? 72 : 12,
                  width: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isSealOpened
                          ? [
                              Colors.grey.withOpacity(0.3),
                              Colors.white.withOpacity(0.5),
                              Colors.grey.withOpacity(0.3),
                            ]
                          : [
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.1),
                            ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
