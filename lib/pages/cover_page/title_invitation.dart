import 'package:flutter/material.dart';

class TitleInvitation extends StatelessWidget {
  const TitleInvitation({
    super.key,
    this.isBottomTitle,
    required this.flashValue,
  });

  final bool? isBottomTitle;
  final double flashValue;

  @override
  Widget build(BuildContext context) {
    return isBottomTitle == true
        ? Opacity(
            opacity: flashValue,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "P",
                  style: TextStyle(
                    fontFamily: "Upakarti",
                    fontSize: 56,
                    color: Color.fromARGB(255, 230, 211, 164),
                    height: 1.2,
                    letterSpacing: 1,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "ernikahan",
                      style: TextStyle(
                        fontFamily: "Upakarti",
                        fontSize: 48,
                        color: Color.fromARGB(255, 230, 211, 164),
                        height: 1.2,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Opacity(
            opacity: flashValue,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "U",
                  style: TextStyle(
                    fontFamily: "Upakarti",
                    fontSize: 64,
                    color: Color.fromARGB(255, 230, 211, 164),
                    height: 1.2,
                    letterSpacing: 1,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "ndangan",
                      style: TextStyle(
                        fontFamily: "Upakarti",
                        fontSize: 48,
                        color: Color.fromARGB(255, 230, 211, 164),
                        height: 1.2,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          );
  }
}
