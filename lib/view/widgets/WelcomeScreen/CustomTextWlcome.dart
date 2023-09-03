import 'package:assro/utils/constant/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';
import 'TextUtils.dart';

class CustomTextWelcome extends StatelessWidget {
  const CustomTextWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 190,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5),
        ),
        child:  TextUtils(
          titleText: 'Welcome',
          style: Styles.textStyle30.copyWith(
            fontSize: 35,
            color: AppColor.whiteColor,
          ), textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
