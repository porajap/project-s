import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';

class ButtonOfNumPad extends StatelessWidget {
  const ButtonOfNumPad({Key? key, required this.num, this.onPressed}) : super(key: key);

  final String num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: FloatingActionButton.extended(
        elevation: 0,
        heroTag: num,
        backgroundColor: AppColor.subTitle.withOpacity(0.5),
        onPressed: onPressed,
        label: Text(
          "$num",
          style: TextStyle(color: AppColor.title),
        ),
      ),
    );
  }
}
