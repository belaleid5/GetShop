import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColor.thirdColor,
      thickness: 1,
    );
  }
}