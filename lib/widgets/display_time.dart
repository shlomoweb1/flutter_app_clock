import 'package:clock_app/store/time/store_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class DisplayTime extends StatelessWidget {
  final DateTimeStore dateTimeStore = DateTimeStore();
  final String format;
  
  final TextStyle style;

  DisplayTime({super.key, required this.format, required this.style});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // 'HH:mm'
        // 'EEE, d MMM'
        var formattedTime =
            DateFormat(format).format(dateTimeStore.currentDateTime);
        return Text(
          formattedTime,
          style: style,
        );
      },
    );
  }
}
