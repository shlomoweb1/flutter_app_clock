import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayTime extends StatefulWidget {
  const DisplayTime({super.key});

  @override
  State<DisplayTime> createState() => _DisplayTimeState();
}

class _DisplayTimeState extends State<DisplayTime> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var formattedTime = DateFormat('HH:mm').format(now);

    return Text(
      formattedTime,
      style: const TextStyle(color: Colors.white, fontSize: 64),
    );
  }
}
