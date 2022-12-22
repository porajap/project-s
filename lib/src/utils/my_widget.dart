import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'constants.dart';

Widget MyScreen({required Widget child}) => Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: child,
    );

Widget InputHeight({required Widget child}) => Container(height: 50, child: child);

Widget FormVertical() => SizedBox(height: 10);

Widget FormHorizontal() => SizedBox(width: 10);

Widget TextNotFound({String? msg}) {
  return Center(
    child: Text(
      msg != null ? '${msg}' : "${Constants.textNotFound}",
      style: TextStyle(
        color: Colors.black54,
        fontSize: 16,
      ),
    ),
  );
}


