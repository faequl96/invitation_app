import 'dart:ui';

import 'package:flutter/material.dart';

class KeyInvitation extends StatelessWidget {
  const KeyInvitation({super.key, required this.onOpened});

  final Function() onOpened;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        onOpened();
      },
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(180, 255, 212, 102),
                  Color.fromARGB(180, 255, 176, 176),
                ],
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Buka Segel Undangan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
