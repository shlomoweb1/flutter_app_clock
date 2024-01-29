import 'package:clock_app/store/time/store_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kosher_dart/kosher_dart.dart';

class DisplayHebrewParsha extends StatelessWidget {
  final TextStyle style;
  final DateTimeStore dateTimeStore = DateTimeStore();
  final HebrewDateFormatter hebrewDateFormatter = HebrewDateFormatter()
    ..hebrewFormat = true;

  DisplayHebrewParsha({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // 'HH:mm'
        // 'EEE, d MMM'
        var formattedTime = hebrewDateFormatter.formatWeeklyParsha(dateTimeStore.jewishCalendar);
        return Text(
          formattedTime,
          style: style,
        );
      },
    );
  }
}
