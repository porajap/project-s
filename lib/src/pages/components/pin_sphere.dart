import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';

class PinSphere extends StatelessWidget {
  final bool input;

  const PinSphere({Key? key, required this.input}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: input ? AppColor.primary : null,
          border: Border.all(color: AppColor.primary.withOpacity(0.75), width: 1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
