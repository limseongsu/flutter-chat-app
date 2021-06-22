import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension MyInt on int {
  String toDateString() {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(this));
  }
}


String datemillisecondsToSring(int mills) {
  return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(mills));
}