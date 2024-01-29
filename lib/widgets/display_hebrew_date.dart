import 'package:clock_app/store/time/store_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kosher_dart/kosher_dart.dart';

class DisplayHebrewDate extends StatelessWidget {
  final TextStyle style;
  final DateTimeStore dateTimeStore = DateTimeStore();
  final HebrewDateFormatter hebrewDateFormatter = HebrewDateFormatter()
    ..hebrewFormat = true;

  DisplayHebrewDate({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // 'HH:mm'
        // 'EEE, d MMM'
        var formattedTime = hebrewDateFormatter.format(dateTimeStore.jewishDate);
        return Text(
          formattedTime,
          style: style,
        );
      },
    );
  }
}
