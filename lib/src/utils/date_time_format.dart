import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConvertDateTimeFormat{
  static String convertDateFormat({required DateTime date, String format = "dd-MM-yyy"}) => DateFormat(format).format(date);
  static String convertTimeFormat({required TimeOfDay time}) => '${time.hour}:${time.minute}';
}