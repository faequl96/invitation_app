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
              child: Stack(
                children: [
                  scrollValue > size.height - 70
                      ? AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: 90,
                          left: scrollValue > size.height - 50 ? -30 : 60,
                          child: SizedBox(
                            height: 60,
                            width: size.width,
                            child: const Center(
                              child: Text(
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
                        )
                      : const SizedBox.shrink(),
                  scrollValue > size.height - 20
                      ? Positioned(
                          top: 134,
                          left: -34,
                          child: SizedBox(
                            height: 80,
                            width: size.width,
                            child: Center(
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
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
                          ),
                        )
                      : const SizedBox.shrink(),
                  scrollValue > size.height - 70
                      ? AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: 190,
                          right: scrollValue > size.height - 50 ? -36 : 66,
                          child: SizedBox(
                            height: 60,
                            width: size.width,
                            child: const Center(
                              child: Text(
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
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          scrollValue > size.height - 70
              ? AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  bottom: scrollValue > size.height - 50 ? 120 : 50,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: scrollValue > size.height - 50 ? 1 : 0.1,
                    child: SizedBox(
                      height: 30,
                      width: size.width,
                      child: Center(
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
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
