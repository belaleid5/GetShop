import 'package:assro/routes/RouteNamed.dart';
import 'package:assro/utils/constant/color.dart';
import 'package:assro/utils/constant/styles.dart';
import 'package:flutter/material.dart';

import 'TextUtils.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.titleAuthButton,
    required this.onPressed, required this.color,
  });
  final String titleAuthButton;
  final void Function() onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:  TextUtils(
      titleText: titleAuthButton,
      style: Styles.textStyle18.copyWith(
        color: color,
      ), textAlign: TextAlign.center,
    ),
    );
  }
}
