import 'dart:async';
import 'package:kosher_dart/kosher_dart.dart';
import 'package:mobx/mobx.dart';

part 'store_time.g.dart';
// ignore: library_private_types_in_public_api
class DateTimeStore = _DateTimeStore with _$DateTimeStore;

abstract class _DateTimeStore with Store {
  @observable
  DateTime currentDateTime = DateTime.now();
  JewishDate jewishDate = JewishDate();
  JewishCalendar jewishCalendar = JewishCalendar();

  @action
  void updateDateTime() {
    currentDateTime = DateTime.now();
    jewishDate.setDate(currentDateTime);
    jewishCalendar.setDate(currentDateTime);
  }

  _DateTimeStore() {
    // Set up a timer to update the DateTime every second
    Timer.periodic(const Duration(seconds: 1), (_) {
      updateDateTime();
    });
  }
}
