import 'package:flutter/cupertino.dart';

import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/styles.dart';
import '../../WelcomeScreen/CustomTextButton.dart';
import '../../WelcomeScreen/TextUtils.dart';

class UnderContainer extends StatelessWidget {
  const UnderContainer({
    super.key,
    required this.titleAccount,
    required this.titleAuth,
    required this.onPressed,
  });

  final String titleAccount;
  final String titleAuth;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(32),
            topRight: Radius.circular(32)),

      ),
      height: 140,
      child:  
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                  titleText: titleAccount,
                  style:Styles.textStyle16, textAlign: TextAlign.center,),
                 CustomTextButton(

                   titleAuthButton: titleAuth,
                   onPressed: onPressed,
                   color: AppColor.primaryColor,
                 ),
            ],
          ),
    );
  }
}
