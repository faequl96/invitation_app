import 'package:flutter/material.dart';
import 'package:invitation_app/enum/enums.dart';
import 'package:invitation_app/methods/methods.dart';
import 'package:invitation_app/models/date_countdown_scroll_value.dart';
import 'package:invitation_app/pages/cover_page/countdown.dart';
import 'package:invitation_app/pages/cover_page/key_invitation.dart';
import 'package:invitation_app/pages/cover_page/light_effect.dart';
import 'package:invitation_app/pages/cover_page/right_bg.dart';
import 'package:invitation_app/pages/cover_page/left_bg.dart';
import 'package:invitation_app/pages/cover_page/seal_invitation.dart';
import 'package:invitation_app/pages/cover_page/swipe_up.dart';
import 'package:invitation_app/pages/cover_page/title_invitation.dart';
import 'package:invitation_app/pages/page_1/page_1.dart';
import 'package:invitation_app/pages/page_2/page_2.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = PageController();

  H hType = H.Sm;
  W wType = W.Sm;

  double scrollValue = 0;

  double moveValue = 0;
  double opacityValue = 1;
  double opacityMemory = 0;
  double flashValue = 1;

  DateCountdownScrollValue dCScrollValue1 = DateCountdownScrollValue(
    xMove: 0,
    yMove: 0,
  );
  DateCountdownScrollValue dCScrollValue2 = DateCountdownScrollValue(
    xMove: 0,
    yMove: 0,
  );

  bool isKeyOpened = false;
  bool isSealOpened = false;
  bool isOpenCompleted = false;

  String _toName = "";
  String _instance = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Size size = MediaQuery.of(context).size;

      if (size.height <= 660) {
        hType = H.Sm;
      } else if (size.height > 660 && size.height <= 720) {
        hType = H.Md;
      } else if (size.height > 720 && size.height <= 780) {
        hType = H.Lg;
      } else if (size.height > 780) {
        hType = H.Xl;
      }

      if (size.width <= 360) {
        wType = W.Sm;
      } else if (size.width > 360 && size.width <= 376) {
        wType = W.Md;
      } else if (size.width > 376 && size.width <= 392) {
        wType = W.Lg;
      } else if (size.width > 392) {
        wType = W.Xl;
      }

      _setCountdownScrollValue();
    });

    _pageController.addListener(_scrollListener);

    _toName = Uri.base.queryParameters["to"] ?? "";
    _instance = Uri.base.queryParameters["instance"] ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            if (scrollValue < size.height * 2)
              Page1(
                scrollValue: scrollValue,
                hType: hType,
                wType: wType,
              ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white.withOpacity(opacityValue),
            ),
            scrollValue > size.height + 110
                ? const SizedBox.shrink()
                : Positioned(
                    right: -moveValue,
                    child: LightEffect(
                      opacityValue: opacityValue,
                      isRight: true,
                    ),
                  ),
            scrollValue > size.height + 110
                ? const SizedBox.shrink()
                : Positioned(
                    left: -moveValue,
                    child: LightEffect(
                      opacityValue: opacityValue,
                      isRight: false,
                    ),
                  ),
            scrollValue > size.height + 110
                ? const SizedBox.shrink()
                : Positioned(
                    right: -moveValue,
                    child: RightBackground(
                      hType: hType,
                      wType: wType,
                      backgroundType: BackgroundType.Cover,
                      moveValue: moveValue,
                      flashValue: flashValue,
                    ),
                  ),
            scrollValue > size.height + 110
                ? const SizedBox.shrink()
                : Positioned(
                    left: -moveValue,
                    child: LeftBackground(
                      hType: hType,
                      wType: wType,
                      backgroundType: BackgroundType.Cover,
                      moveValue: moveValue,
                      flashValue: flashValue,
                    ),
                  ),
            scrollValue > size.height + 110
                ? const SizedBox.shrink()
                : Positioned(
                    right: -moveValue,
                    child: RightBackground(
                      hType: hType,
                      wType: wType,
                      backgroundType: BackgroundType.Cover,
                      isTransparent: true,
                    ),
                  ),
            Positioned(
              top: h(hType, 6, 12, 30, 60) - (scrollValue / 14),
              left: w(wType, 45, 48, 51, 54),
              child: TitleInvitation(
                wType: wType,
                flashValue: flashValue,
              ),
            ),
            Positioned(
              top: h(hType, 50, 56, 74, 104) - (scrollValue / 14),
              right: w(wType, 45, 48, 51, 54),
              child: TitleInvitation(
                wType: wType,
                isBottomTitle: true,
                flashValue: flashValue,
              ),
            ),
            Positioned(
              left: dCScrollValue2.xMove >= (80 + ((size.width - 180) / 4)) &&
                      dCScrollValue2.xMove <=
                          (size.width / 2) - (((size.width - 180) / 4) / 2)
                  ? dCScrollValue2.xMove
                  : dCScrollValue2.xMove < (80 + ((size.width - 180) / 4))
                      ? (80 + ((size.width - 180) / 4))
                      : (size.width / 2) - (((size.width - 180) / 4) / 2),
              bottom: dCScrollValue2.yMove >= 40
                  ? dCScrollValue2.yMove
                  : dCScrollValue2.yMove < 40
                      ? 40
                      : h(hType, 202, 218, 234, 250),
              child: CountDown(
                hType: hType,
                wType: wType,
                unitTimeType: UnitTimeType.Hour,
              ),
            ),
            Positioned(
              right: dCScrollValue2.xMove >= (80 + ((size.width - 180) / 4)) &&
                      dCScrollValue2.xMove <=
                          (size.width / 2) - (((size.width - 180) / 4) / 2)
                  ? dCScrollValue2.xMove
                  : dCScrollValue2.xMove < (80 + ((size.width - 180) / 4))
                      ? (80 + ((size.width - 180) / 4))
                      : (size.width / 2) - (((size.width - 180) / 4) / 2),
              bottom: dCScrollValue2.yMove >= 40
                  ? dCScrollValue2.yMove
                  : dCScrollValue2.yMove < 40
                      ? 40
                      : h(hType, 202, 218, 234, 250),
              child: CountDown(
                hType: hType,
                wType: wType,
                unitTimeType: UnitTimeType.Minute,
              ),
            ),
            Positioned(
              right: dCScrollValue1.xMove >= 60 &&
                      dCScrollValue1.xMove <=
                          (size.width / 2) - (((size.width - 180) / 4) / 2)
                  ? dCScrollValue1.xMove
                  : dCScrollValue1.xMove < 60
                      ? 60
                      : (size.width / 2) - (((size.width - 180) / 4) / 2),
              bottom: dCScrollValue1.yMove >= 40
                  ? dCScrollValue1.yMove
                  : dCScrollValue1.yMove < 40
                      ? 40
                      : h(hType, 202, 218, 234, 250),
              child: CountDown(
                hType: hType,
                wType: wType,
                unitTimeType: UnitTimeType.Second,
              ),
            ),
            Positioned(
              left: dCScrollValue1.xMove >= 60 &&
                      dCScrollValue1.xMove <=
                          (size.width / 2) - (((size.width - 180) / 4) / 2)
                  ? dCScrollValue1.xMove
                  : dCScrollValue1.xMove < 60
                      ? 60
                      : (size.width / 2) - (((size.width - 180) / 4) / 2),
              bottom: dCScrollValue1.yMove >= 40
                  ? dCScrollValue1.yMove
                  : dCScrollValue1.yMove < 40
                      ? 40
                      : h(hType, 202, 218, 234, 250),
              child: CountDown(
                hType: hType,
                wType: wType,
                unitTimeType: UnitTimeType.Day,
              ),
            ),
            if (scrollValue == 0)
              if (_toName.isNotEmpty)
                Positioned(
                  bottom: h(hType, 136, 146, 156, 166),
                  child: Text(
                    toCapitalize(_toName),
                    style: TextStyle(
                      fontSize: w(wType, 16, 18, 19, 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            if (scrollValue == 0)
              if (_instance.isNotEmpty)
                Positioned(
                  bottom: h(hType, 108, 116, 124, 132),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/$_instance.png"),
                        height: w(wType, 20, 22, 24, 26),
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            toCapitalize(_instance),
                            style: TextStyle(
                              fontSize: w(wType, 15, 16, 17, 18),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ],
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
                      SizedBox(height: size.height, width: double.maxFinite),
                      SizedBox(height: size.height, width: double.maxFinite),
                      const Page2(),
                      SizedBox(height: size.height, width: double.maxFinite),
                    ],
                  ),
                ),
                // AnimatedPositioned(
                //   duration: const Duration(milliseconds: 1000),
                //   top: isSealOpened ? -size.height : 0,
                //   child: SealInvitation(isSealOpened: isSealOpened),
                // ),
                // if (isOpenCompleted)
                if (scrollValue < 10)
                  Positioned(
                    bottom: 0,
                    child: SwipeUp(
                      hType: hType,
                      wType: wType,
                      isOpenCompleted: isOpenCompleted,
                    ),
                  ),
                // AnimatedPositioned(
                //   duration: const Duration(milliseconds: 200),
                //   bottom: isKeyOpened ? -50 : 20,
                //   child: KeyInvitation(
                //     onOpened: () async {
                //       isKeyOpened = true;
                //       setState(() {});

                //       await Future.delayed(const Duration(milliseconds: 300));
                //       isSealOpened = true;
                //       setState(() {});

                //       await Future.delayed(const Duration(milliseconds: 1000));
                //       isOpenCompleted = true;
                //       setState(() {});
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setCountdownScrollValue() {
    final Size size = MediaQuery.of(context).size;

    dCScrollValue1 = DateCountdownScrollValue(
      xMove: 60,
      yMove: h(hType, 202, 218, 234, 250),
    );
    dCScrollValue2 = DateCountdownScrollValue(
      xMove: 80 + ((size.width - 180) / 4),
      yMove: h(hType, 202, 218, 234, 250),
    );
    setState(() {});
  }

  _scrollListener() {
    final Size size = MediaQuery.of(context).size;

    final double dividedSize = size.height / size.width;

    scrollValue = _pageController.offset.ceil().toDouble();
    final double sV = scrollValue;
    moveValue = (_pageController.offset / dividedSize) / 2;

    if (sV > 0 && sV <= size.height / 3) {
      dCScrollValue1 = DateCountdownScrollValue(
        xMove: 60 + sV,
        yMove: h(hType, 202, 218, 234, 250),
      );
      dCScrollValue2 = DateCountdownScrollValue(
        xMove: (80 + ((size.width - 180) / 4)) + sV,
        yMove: h(hType, 202, 218, 234, 250),
      );
    } else if (sV > size.height / 3 && sV <= (size.height / 3) * 2) {
      dCScrollValue1 = DateCountdownScrollValue(
        xMove: ((size.width / 2) - (((size.width - 180) / 4) / 2)),
        yMove: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
      dCScrollValue2 = DateCountdownScrollValue(
        xMove: ((size.width / 2) - (((size.width - 180) / 4) / 2)),
        yMove: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
    } else if (sV > (size.height / 3) * 2 && sV <= (size.height / 3) * 3) {
      dCScrollValue1 = DateCountdownScrollValue(
        xMove: ((size.width / 2) - (((size.width - 180) / 4) / 2)) -
            (sV - ((size.height / 3) * 2)),
        yMove: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
      dCScrollValue2 = DateCountdownScrollValue(
        xMove: ((size.width / 2) - (((size.width - 180) / 4) / 2)) -
            (sV - ((size.height / 3) * 2)),
        yMove: h(hType, 202, 218, 234, 250) - (sV - (size.height / 3)),
      );
    }

    final double opacity = size.height / 20;

    if (scrollValue <= size.height) {
      if (scrollValue <= opacity) {
        opacityValue = 1;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 1;
      } else if (scrollValue > opacity && scrollValue <= opacity * 2) {
        opacityValue = 0.95;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.85;
      } else if (scrollValue > opacity * 2 && scrollValue <= opacity * 3) {
        opacityValue = 0.9;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.7;
      } else if (scrollValue > opacity * 3 && scrollValue <= opacity * 4) {
        opacityValue = 0.85;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.55;
      } else if (scrollValue > opacity * 4 && scrollValue <= opacity * 5) {
        opacityValue = 0.8;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.4;
      } else if (scrollValue > opacity * 5 && scrollValue <= opacity * 6) {
        opacityValue = 0.75;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.25;
      } else if (scrollValue > opacity * 6 && scrollValue <= opacity * 7) {
        opacityValue = 0.7;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0.1;
      } else if (scrollValue > opacity * 7 && scrollValue <= opacity * 8) {
        opacityValue = 0.65;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      } else if (scrollValue > opacity * 8 && scrollValue <= opacity * 9) {
        opacityValue = 0.6;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      } else if (scrollValue > opacity * 9 && scrollValue <= opacity * 10) {
        opacityValue = 0.55;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 10 && scrollValue <= opacity * 11) {
        opacityValue = 0.5;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 11 && scrollValue <= opacity * 12) {
        opacityValue = 0.45;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 12 && scrollValue <= opacity * 13) {
        opacityValue = 0.4;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 13 && scrollValue <= opacity * 14) {
        opacityValue = 0.35;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 14 && scrollValue <= opacity * 15) {
        opacityValue = 0.3;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 15 && scrollValue <= opacity * 16) {
        opacityValue = 0.25;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 16 && scrollValue <= opacity * 17) {
        opacityValue = 0.2;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 17 && scrollValue <= opacity * 18) {
        opacityValue = 0.15;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 18 && scrollValue <= opacity * 19) {
        opacityValue = 0.1;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
      } else if (scrollValue > opacity * 19 && scrollValue <= opacity * 20) {
        opacityValue = 0.05;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      } else if (scrollValue > opacity * 20 && scrollValue <= opacity * 21) {
        opacityValue = 0;
        if (opacityValue != opacityMemory) setState(() {});
        opacityMemory = opacityValue;
        flashValue = 0;
      }

      if (opacityValue == opacityMemory) {
        if (sV.ceil() % 2 == 0) setState(() {});
      }
    }

    if (scrollValue == 0) setState(() {});
    if (scrollValue == size.height) setState(() {});

    if (scrollValue > size.height * 2) {
      if (scrollValue - (size.height * 2) <= opacity) {
        opacityValue = 1;
        flashValue = 1;
      } else if (scrollValue - (size.height * 2) > opacity &&
          scrollValue - (size.height * 2) <= opacity * 2) {
        opacityValue = 0.95;
        flashValue = 0.85;
      } else if (scrollValue - (size.height * 2) > opacity * 2 &&
          scrollValue - (size.height * 2) <= opacity * 3) {
        opacityValue = 0.9;
        flashValue = 0.7;
      } else if (scrollValue - (size.height * 2) > opacity * 3 &&
          scrollValue - (size.height * 2) <= opacity * 4) {
        opacityValue = 0.85;
        flashValue = 0.55;
      } else if (scrollValue - (size.height * 2) > opacity * 4 &&
          scrollValue - (size.height * 2) <= opacity * 5) {
        opacityValue = 0.8;
        flashValue = 0.4;
      } else if (scrollValue - (size.height * 2) > opacity * 5 &&
          scrollValue - (size.height * 2) <= opacity * 6) {
        opacityValue = 0.75;
        flashValue = 0.25;
      } else if (scrollValue - (size.height * 2) > opacity * 6 &&
          scrollValue - (size.height * 2) <= opacity * 7) {
        opacityValue = 0.7;
        flashValue = 0.1;
      } else if (scrollValue - (size.height * 2) > opacity * 7 &&
          scrollValue - (size.height * 2) <= opacity * 8) {
        opacityValue = 0.65;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > opacity * 8 &&
          scrollValue - (size.height * 2) <= opacity * 9) {
        opacityValue = 0.6;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > opacity * 9 &&
          scrollValue - (size.height * 2) <= opacity * 10) {
        opacityValue = 0.55;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > opacity * 10 &&
          scrollValue - (size.height * 2) <= opacity * 11) {
        opacityValue = 0.5;
        flashValue = 0;
      } else if (scrollValue - (size.height * 2) > opacity * 11 &&
          scrollValue - (size.height * 2) <= opacity * 12) {
        opacityValue = 0.45;
      } else if (scrollValue - (size.height * 2) > opacity * 12 &&
          scrollValue - (size.height * 2) <= opacity * 13) {
        opacityValue = 0.4;
      } else if (scrollValue - (size.height * 2) > opacity * 13 &&
          scrollValue - (size.height * 2) <= opacity * 14) {
        opacityValue = 0.35;
      } else if (scrollValue - (size.height * 2) > opacity * 14 &&
          scrollValue - (size.height * 2) <= opacity * 15) {
        opacityValue = 0.3;
      } else if (scrollValue - (size.height * 2) > opacity * 15 &&
          scrollValue - (size.height * 2) <= opacity * 16) {
        opacityValue = 0.25;
      } else if (scrollValue - (size.height * 2) > opacity * 16 &&
          scrollValue - (size.height * 2) <= opacity * 17) {
        opacityValue = 0.2;
      } else if (scrollValue - (size.height * 2) > opacity * 17 &&
          scrollValue - (size.height * 2) <= opacity * 18) {
        opacityValue = 0.15;
      } else if (scrollValue - (size.height * 2) > opacity * 18 &&
          scrollValue - (size.height * 2) <= opacity * 19) {
        opacityValue = 0.1;
      } else if (scrollValue - (size.height * 2) > opacity * 19 &&
          scrollValue - (size.height * 2) <= opacity * 20) {
        opacityValue = 0.05;
      } else if (scrollValue - (size.height * 2) > opacity * 20 &&
          scrollValue - (size.height * 2) <= opacity * 21) {
        opacityValue = 0;
      }
    }
  }
}
