import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:invitation_app/enum/enums.dart';
import 'package:invitation_app/methods/methods.dart';

class Page1 extends StatelessWidget {
  Page1({super.key, required this.scrollValue, required this.hType});

  final double scrollValue;
  final H hType;

  final DateTime _dateTime = DateTime(2024, 8, 10, 9);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final DateFormat dateFormater = DateFormat("EEEE, dd MMM yyyy", "id_ID");

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/default_bg.png"),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: h(hType, 22, 38, 54, 70),
            child: const Text(
              "Pernikahan",
              style: TextStyle(
                fontFamily: "BrushScriptMT",
                fontSize: 70,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 230, 211, 164),
              ),
            ),
          ),
          Positioned(
            top: h(hType, 86, 102, 118, 134),
            child: const Text(
              "Dari",
              style: TextStyle(
                fontFamily: "BrushScriptMT",
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            child: Container(
              width: size.width - 60,
              height: size.width - 60,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/unifying_frame.png"),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            bottom: 394,
            right: scrollValue > size.height - 50 ? 130 : 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: scrollValue > size.height - 50 ? 1 : 0,
              child: const Text(
                "Rahma",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 334,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: scrollValue > size.height - 1 ? 1 : 0,
              child: const Text(
                "&",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            bottom: 294,
            left: scrollValue > size.height - 50 ? 140 : 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: scrollValue > size.height - 50 ? 1 : 0,
              child: const Text(
                "Faiq",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            bottom: scrollValue > size.height - 50 ? 120 : 50,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: scrollValue > size.height - 50 ? 1 : 0,
              child: Text(
                dateFormater.format(_dateTime),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
