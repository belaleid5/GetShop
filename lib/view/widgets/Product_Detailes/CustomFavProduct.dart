import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../logic/controllers/ProductController.dart';
import '../../../model/product_model.dart';
import '../../../utils/constant/color.dart';
import '../HomeScreen/CustomIconButton.dart';

class CustomFavProduct extends StatelessWidget {
  const CustomFavProduct({
    super.key,
    required this.productController,
    required this.product,
  });

  final ProductController productController;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Container(
        margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
        decoration: BoxDecoration(
          color:AppColor.blackColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(32),
        ),
        child: CustomIconButton(
            onPressed: ()
            {
              productController.mangeIsFavorite(product.id);
            },
            icon:productController.isFavorite(product.id) ?
            const Icon(Icons.favorite,color: AppColor.primaryColor,) :
            const Icon(Icons.favorite_border,color:
            AppColor.primaryColor,))),);
  }
}
