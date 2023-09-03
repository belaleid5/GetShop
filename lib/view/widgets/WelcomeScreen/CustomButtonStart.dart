import 'package:assro/utils/constant/color.dart';
import 'package:assro/utils/constant/styles.dart';
import 'package:flutter/material.dart';

import 'TextUtils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.titleButton,
     this.onPressed, required this.heightButton, required this.widthButton,
  });
  final String titleButton;
  final void Function() ?onPressed;
  final double heightButton;
  final double widthButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                  ),),
          backgroundColor: MaterialStateProperty.all<Color?>(AppColor.primaryColor),
          minimumSize: MaterialStateProperty.all<Size?>( Size(widthButton, heightButton)),

      ),
        onPressed:onPressed,
        child:  TextUtils(
          titleText: titleButton,
           style:Styles.textStyle22.copyWith(
            fontWeight: FontWeight.w700,
             color: AppColor.whiteColor,
                     ), textAlign: TextAlign.center,
        ),
        );
  }
}
