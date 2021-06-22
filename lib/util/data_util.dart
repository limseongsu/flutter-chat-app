import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String datemillisecondsToSring(int mills) {
  return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(mills));
}