import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/CartController.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';

class AddCartAndTotalPrice extends StatelessWidget {

  const AddCartAndTotalPrice({
    super.key, this.onPressed,
    required this.titleButton,
    required this.totalPrice,
    required this.price,
  });
  final Function()? onPressed;
  final String titleButton;
  final String totalPrice;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(25),
      child:  Row(
        children: [
        Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:[
               TextUtils(
                   titleText: totalPrice,
                   style: Styles.textStyle18.copyWith(
                 color: AppColor.blackColor.withOpacity(0.2),
               ), textAlign: TextAlign.center),
               TextUtils(titleText: price,
                   style: Styles.textStyle20.copyWith(
                 height: 1.5,
               ), textAlign: TextAlign.center),
             ]),
          const SizedBox(width: 20,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  onPressed: onPressed,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(titleText: titleButton,
                          style: Styles.textStyle16, textAlign: TextAlign.center),
                      const SizedBox(width: 10,),
                      const Icon(Icons.shopping_cart_rounded)

                    ],)),
            ),
          ),
        ],
      ),
    );
  }
}
