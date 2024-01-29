// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_time.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DateTimeStore on _DateTimeStore, Store {
  late final _$currentDateTimeAtom =
      Atom(name: '_DateTimeStore.currentDateTime', context: context);

  @override
  DateTime get currentDateTime {
    _$currentDateTimeAtom.reportRead();
    return super.currentDateTime;
  }

  @override
  set currentDateTime(DateTime value) {
    _$currentDateTimeAtom.reportWrite(value, super.currentDateTime, () {
      super.currentDateTime = value;
    });
  }

  late final _$_DateTimeStoreActionController =
      ActionController(name: '_DateTimeStore', context: context);

  @override
  void updateDateTime() {
    final _$actionInfo = _$_DateTimeStoreActionController.startAction(
        name: '_DateTimeStore.updateDateTime');
    try {
      return super.updateDateTime();
    } finally {
      _$_DateTimeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentDateTime: ${currentDateTime}
    ''';
  }
}
