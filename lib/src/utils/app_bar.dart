import 'package:flutter/material.dart';

MyAppBar({required String title, required BuildContext context, Widget? action, bool showBack = false}) => AppBar(
      title: Text(
        "$title",
      ),
      leading: IconButton(
        splashRadius: 18,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: showBack ? Icon(Icons.arrow_back_rounded) : SizedBox(),
      ),
      actions: [
        action == null
            ? SizedBox()
            : Container(
                padding: EdgeInsets.only(right: 8),
                child: action,
              )
      ],
    );

Widget AppBarAction({
  required VoidCallback onPressed,
  required Widget icon,
}) =>
    IconButton(
      onPressed: onPressed,
      icon: icon,
      splashRadius: 18,
    );
