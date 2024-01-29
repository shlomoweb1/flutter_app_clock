import 'dart:async';
import 'package:mobx/mobx.dart';

part 'store_time.g.dart';
// ignore: library_private_types_in_public_api
class DateTimeStore = _DateTimeStore with _$DateTimeStore;

abstract class _DateTimeStore with Store {
  @observable
  DateTime currentDateTime = DateTime.now();

  @action
  void updateDateTime() {
    currentDateTime = DateTime.now();
  }

  _DateTimeStore() {
    // Set up a timer to update the DateTime every second
    Timer.periodic(const Duration(seconds: 1), (_) {
      updateDateTime();
    });
  }
}
