import 'package:assro/routes/RouteNamed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';

class CustomCartEmpty extends StatelessWidget {
  const CustomCartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        const Icon(Icons.shopping_cart_rounded,size: 200,),
        RichText(text: TextSpan(
            children: [
              TextSpan(text: "Your Cart is ",style: Styles.textStyle20.copyWith(
                color: AppColor.blackColor,
              )),
              TextSpan(text: "Empty",style: Styles.textStyle20.copyWith(
                color: AppColor.primaryColor,
              )),
            ]
        )),
        const
        SizedBox(height: 10),
        const TextUtils(titleText: "Add items to get  Started", style: Styles.textStyle14,
            textAlign: TextAlign.center),
        const SizedBox(height: 30),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                )
            ),
            onPressed: ()
            {
              Get.offNamed(RouteName.mainScreen);
            },
            child: const Text('Go To Home')),
      ],
    ),);
  }
}
