import 'package:clock_app/store/time/store_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DisplayTimezone extends StatelessWidget {
  final DateTimeStore dateTimeStore = DateTimeStore();

  final TextStyle style; // Mark the field as final

  DisplayTimezone({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var timezoneString = dateTimeStore.currentDateTime.timeZoneOffset
            .toString()
            .split('.')
            .first;
        var offsetSign = '';
        if (!timezoneString.startsWith('-')) offsetSign = '+';

        return Text(
          'UTC $offsetSign$timezoneString',
          style: style,
        );
      },
    );
  }
}
