import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:invitation_app/enum/enums.dart';
import 'package:invitation_app/methods/methods.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.hType, required this.wType});

  final H hType;
  final W wType;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
          Container(
            margin: EdgeInsets.all(w(wType, 14, 16, 18, 20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: const GradientBoxBorder(
                width: 2,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(0, 230, 211, 164),
                    Color.fromARGB(255, 255, 198, 192),
                    Color.fromARGB(255, 230, 211, 164),
                    Color.fromARGB(255, 255, 198, 192),
                    Color.fromARGB(0, 230, 211, 164),
                  ],
                  stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                  transform: GradientRotation(-0.2),
                ),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(0, 230, 211, 164),
                  Color.fromARGB(64, 230, 211, 164),
                  Color.fromARGB(76, 230, 211, 164),
                  Color.fromARGB(64, 230, 211, 164),
                  Color.fromARGB(0, 230, 211, 164),
                ],
                stops: [0.1, 0.4, 0.5, 0.6, 0.9],
                transform: GradientRotation(-0.2),
              ),
            ),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w(wType, 28, 30, 32, 34),
              ),
              child: Column(
                children: [
                  SizedBox(height: h(hType, 40, 56, 72, 88)),
                  Image.asset(
                    "assets/bismillah.png",
                    width: w(wType, 130, 142, 154, 166),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Assalamu'alaikum Wr. Wb.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 230, 211, 164),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Dengan memohon rahmat dan ridho Allah Subhanahu Wa Ta'ala. Kami mengundang Bapak/Ibu/Saudara/I, untuk menghadiri resepsi pernikahan kami.",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -4,
            left: -4,
            child: Image.asset(
              "assets/frame_top_left.png",
              width: w(wType, 120, 128, 136, 144),
            ),
          ),
          Positioned(
            bottom: -4,
            right: -4,
            child: Image.asset(
              "assets/frame_bottom_right.png",
              width: w(wType, 120, 128, 136, 144),
            ),
          ),
        ],
      ),
    );
  }
}
