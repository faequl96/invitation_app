import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  Page1({super.key, required this.scrollValue});

  final double scrollValue;

  final DateTime _dateTime = DateTime(2024, 3, 10, 9);

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
            bottom: 250,
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
            duration: const Duration(milliseconds: 500),
            bottom: 444,
            right: scrollValue > size.height - 50 ? 140 : 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: scrollValue > size.height - 50 ? 1 : 0,
              child: const Text(
                "Betina",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 384,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: scrollValue > size.height - 1 ? 1 : 0,
              child: const Text(
                "&",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: 344,
            left: scrollValue > size.height - 50 ? 140 : 40,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: scrollValue > size.height - 50 ? 1 : 0,
              child: const Text(
                "Jantan",
                style: TextStyle(
                  fontFamily: "BrushScriptMT",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 230, 211, 164),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: scrollValue > size.height - 50 ? 120 : 50,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
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
