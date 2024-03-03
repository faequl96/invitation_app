import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitation_app/enum/enums.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key, required this.unitTimeType});

  final UnitTimeType unitTimeType;

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Timer _timer;

  final DateTime dateTime = DateTime(2024, 3, 10, 9);

  String day = "";
  String hour = "";
  String minute = "";
  String second = "";

  String getUnitTime() {
    switch (widget.unitTimeType) {
      case UnitTimeType.Day:
        return "Hari";
      case UnitTimeType.Hour:
        return "Jam";
      case UnitTimeType.Minute:
        return "Menit";
      case UnitTimeType.Second:
        return "Detik";
    }
  }

  String getUnitTimeValue() {
    Duration countDownDuration = dateTime.difference(DateTime.now());

    final int days = countDownDuration.inDays;
    final int hours = countDownDuration.inHours.remainder(24);
    final int minutes = countDownDuration.inMinutes.remainder(60);
    final int seconds = countDownDuration.inSeconds.remainder(60);

    switch (widget.unitTimeType) {
      case UnitTimeType.Day:
        return "$days";
      case UnitTimeType.Hour:
        return "$hours";
      case UnitTimeType.Minute:
        return "$minutes";
      case UnitTimeType.Second:
        return "$seconds";
    }
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: (size.width - 180) / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 230, 211, 164),
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 255, 250, 230),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getUnitTimeValue(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(getUnitTime()),
          ],
        ),
      ),
    );
  }
}
