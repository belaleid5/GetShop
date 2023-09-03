import 'package:flutter/cupertino.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/styles.dart';

class CustomAppBarAuth extends StatelessWidget {
  const CustomAppBarAuth({
    super.key,
    required this.titleAppBarOne,
    required this.titleAppBarTow,
  });
     final String titleAppBarOne;
     final String titleAppBarTow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:80.0,left: 20,bottom: 50),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
             TextSpan(
              text: titleAppBarOne,
              style: Styles.textStyle30.copyWith(
                color: AppColor.secondColor,
              ),
            ),
            TextSpan(
              text: titleAppBarTow,
              style: Styles.textStyle30.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
