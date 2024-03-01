import 'package:flutter/material.dart';
import 'package:invitation_app/pages/cover_page/key_invitation.dart';
import 'package:invitation_app/pages/cover_page/right_bg.dart';
import 'package:invitation_app/pages/cover_page/left_bg.dart';
import 'package:invitation_app/pages/cover_page/seal_invitation.dart';
import 'package:invitation_app/pages/cover_page/swipe_up.dart';
import 'package:invitation_app/pages/page_1/page_1.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = PageController();

  double scrollValue = 0;
  double opacityValue = 1;
  double flashValue = 0.8;

  bool isKeyOpened = false;
  bool isSealOpened = false;
  bool isOpenCompleted = false;

  @override
  void initState() {
    _pageController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const Page1(),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white.withOpacity(opacityValue),
            ),
            Positioned(
              right: -scrollValue,
              child: RightBackground(
                scrollValue: scrollValue,
                flashValue: flashValue,
              ),
            ),
            Positioned(
              left: -scrollValue,
              child: LeftBackground(
                scrollValue: scrollValue,
                flashValue: flashValue,
              ),
            ),
            Positioned(
              right: -scrollValue,
              child: RightBackground(
                isTransparent: true,
                scrollValue: scrollValue,
                flashValue: flashValue,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: size.height,
                        width: double.maxFinite,
                      ),
                      SizedBox(
                        height: size.height,
                        width: double.maxFinite,
                      ),
                      SizedBox(
                        height: size.height,
                        width: double.maxFinite,
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  top: isSealOpened ? -size.height : 0,
                  child: SealInvitation(isSealOpened: isSealOpened),
                ),
                if (isOpenCompleted)
                  if (_pageController.offset < 10)
                    Positioned(
                      bottom: 0,
                      child: SwipeUp(isOpenCompleted: isOpenCompleted),
                    ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  bottom: isKeyOpened ? -50 : 20,
                  child: KeyInvitation(
                    onOpened: () async {
                      isKeyOpened = true;
                      setState(() {});

                      await Future.delayed(const Duration(milliseconds: 300));
                      isSealOpened = true;
                      setState(() {});

                      await Future.delayed(const Duration(milliseconds: 1000));
                      isOpenCompleted = true;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _scrollListener() {
    final Size size = MediaQuery.of(context).size;

    final double dividedSize = size.height / size.width;

    scrollValue = (_pageController.offset / dividedSize) / 2;

    final double opacity = size.height / 20;
    if (_pageController.offset < opacity) {
      opacityValue = 1;
      flashValue = 1;
    } else if (_pageController.offset > opacity &&
        _pageController.offset <= opacity * 2) {
      opacityValue = 0.95;
      flashValue = 0.85;
    } else if (_pageController.offset > opacity * 2 &&
        _pageController.offset <= opacity * 3) {
      opacityValue = 0.9;
      flashValue = 0.7;
    } else if (_pageController.offset > opacity * 3 &&
        _pageController.offset <= opacity * 4) {
      opacityValue = 0.85;
      flashValue = 0.55;
    } else if (_pageController.offset > opacity * 4 &&
        _pageController.offset <= opacity * 5) {
      opacityValue = 0.8;
      flashValue = 0.4;
    } else if (_pageController.offset > opacity * 5 &&
        _pageController.offset <= opacity * 6) {
      opacityValue = 0.75;
      flashValue = 0.25;
    } else if (_pageController.offset > opacity * 6 &&
        _pageController.offset <= opacity * 7) {
      opacityValue = 0.7;
      flashValue = 0.1;
    } else if (_pageController.offset > opacity * 7 &&
        _pageController.offset <= opacity * 8) {
      opacityValue = 0.65;
      flashValue = 0;
    } else if (_pageController.offset > opacity * 8 &&
        _pageController.offset <= opacity * 9) {
      opacityValue = 0.6;
    } else if (_pageController.offset > opacity * 9 &&
        _pageController.offset <= opacity * 10) {
      opacityValue = 0.55;
    } else if (_pageController.offset > opacity * 10 &&
        _pageController.offset <= opacity * 11) {
      opacityValue = 0.5;
    } else if (_pageController.offset > opacity * 11 &&
        _pageController.offset <= opacity * 12) {
      opacityValue = 0.45;
    } else if (_pageController.offset > opacity * 12 &&
        _pageController.offset <= opacity * 13) {
      opacityValue = 0.4;
    } else if (_pageController.offset > opacity * 13 &&
        _pageController.offset <= opacity * 14) {
      opacityValue = 0.35;
    } else if (_pageController.offset > opacity * 14 &&
        _pageController.offset <= opacity * 15) {
      opacityValue = 0.3;
    } else if (_pageController.offset > opacity * 15 &&
        _pageController.offset <= opacity * 16) {
      opacityValue = 0.25;
    } else if (_pageController.offset > opacity * 16 &&
        _pageController.offset <= opacity * 17) {
      opacityValue = 0.2;
    } else if (_pageController.offset > opacity * 17 &&
        _pageController.offset <= opacity * 18) {
      opacityValue = 0.15;
    } else if (_pageController.offset > opacity * 18 &&
        _pageController.offset <= opacity * 19) {
      opacityValue = 0.1;
    } else if (_pageController.offset > opacity * 19 &&
        _pageController.offset <= opacity * 20) {
      opacityValue = 0.05;
    } else if (_pageController.offset > opacity * 20 &&
        _pageController.offset <= opacity * 21) {
      opacityValue = 0;
    }

    setState(() {});
  }
}
