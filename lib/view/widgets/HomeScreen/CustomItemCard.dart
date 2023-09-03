import 'package:assro/logic/controllers/CartController.dart';
import 'package:assro/logic/controllers/ProductController.dart';
import 'package:assro/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';
import 'CustomIconButton.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
    required this.image,
    required this.price,
    required this.rate,
    required this.productId,
    this.product, required this.onTap,

  });
  final String image;
  final double rate;
  final double price;
  final int productId;
  final Product ? product;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    CartController controllerCart = Get.put(CartController());
    return Obx(() =>
        Column(
      children: [
         Row(
          children: [
            CustomIconButton(
              onPressed: ()
              {
                controller.mangeIsFavorite(productId);
              },
                icon:controller.isFavorite(productId) ?
                 const Icon(Icons.favorite,color: AppColor.primaryColor,) :
                 const Icon(Icons.favorite_border,color:
                  AppColor.primaryColor,)) ,
            const Spacer(),
             CustomIconButton(
              onPressed: ()
              {
                controllerCart.addProductToCart(product!);
              },
              icon:const Icon(Icons.shopping_cart_rounded),
              color: AppColor.blackColor,),
          ],),
       InkWell(
         onTap: onTap,
         child:  Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),

           ),
           child: Image.network(image,
             fit: BoxFit.fitHeight,
             height:140,
           ),
         ),
       ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0,right: 15,left: 15),
          child:  Row(
            children: [
              TextUtils(titleText: "\$$price", style: Styles.textStyle14, textAlign: TextAlign.left),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColor.primaryColor,
                ),
                child:  Row(
                  children: [
                    TextUtils(titleText: "$rate", style: Styles.textStyle14.copyWith(
                        color: AppColor.whiteColor,
                        fontSize: 12
                    ),
                        textAlign: TextAlign.left),
                    const Icon(Icons.star,size: 15, color: AppColor.whiteColor,
                    )

                  ],),
              )
            ],),
        ),
      ],
    ));
  }
}
