import 'package:assro/model/product_model.dart';
import 'package:assro/view/widgets/HomeScreen/CustomIconButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/CartController.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required  this.product,
    required this.index,
    required this.quantity,
  });
      final Product product;
      final int index;
      final int quantity;
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Container(
      margin: const EdgeInsets.only(left: 20,right:20 ,top: 8),
      height: 140,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(children: [
            Container(
              margin: const EdgeInsets.only(left: 20,bottom:8 ,top: 8,),
              height: 120,
              width: 100,
              decoration:  BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  image:  DecorationImage(image:  NetworkImage(
                    product.image,
                  ),
                    fit: BoxFit.fill,
                  )

              ),

            ),
            Expanded(
              child: Column(
                children: [
                  TextUtils(
                      titleText: product.title ,
                      style: Styles.textStyle16.copyWith(
                      overflow: TextOverflow.ellipsis

                  ), textAlign: TextAlign.center),
                  const SizedBox(height: 10,),
                  TextUtils(titleText: "\$${controller.productSubTotal[index].toStringAsFixed(2)}", style: Styles.textStyle16, textAlign: TextAlign.center)
                ],),
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                 Row(
                    children:[
                  CustomIconButton(
                      onPressed: ()
                      {
                              controller.removeProductsFormCart(product);
                      },
                      icon: const Icon(Icons.remove_circle)),
                      TextUtils(titleText: "$quantity", style: Styles.textStyle16, textAlign: TextAlign.center),
                  CustomIconButton(
                      onPressed: ()
                      {
                        controller.addProductToCart(product);
                      },
                      icon: const Icon(Icons.add_circle)),
                ]),
                 CustomIconButton(
                     onPressed: ()
                     {
                       controller.removeOneProduct(product);
                     },
                     icon: const Icon(Icons.delete,size:20,color:Colors.red)),

              ],
            ),


          ],),

        ],
      ),
    );
  }
}
