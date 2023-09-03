import 'package:assro/utils/constant/styles.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../logic/controllers/CartController.dart';
import '../../logic/controllers/ProductController.dart';
import '../../logic/controllers/ProductDetailes_controller.dart';
import '../../model/product_model.dart';
import '../../utils/constant/color.dart';
import '../widgets/CartScreen/Cart_total.dart';
import '../widgets/HomeScreen/CustomIconButton.dart';
import '../widgets/Product_Detailes/ColorPicker.dart';
import '../widgets/Product_Detailes/CustomBadges.dart';
import '../widgets/Product_Detailes/CustomDesProductReadMoreText.dart';
import '../widgets/Product_Detailes/CustomFavProduct.dart';
import '../widgets/Product_Detailes/CustomRating.dart';
import '../widgets/Product_Detailes/CustomSmoothIndicator.dart';
import '../widgets/Product_Detailes/CustomTitleProduct.dart';
import '../widgets/Product_Detailes/SizeListProduct.dart';
import '../widgets/Product_Detailes/SliderImage.dart';


class ProductDetailes extends StatelessWidget {
  const ProductDetailes({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    ProductDetailesController controller = Get.put(ProductDetailesController());
    CartController cartController = Get.put(CartController());
    ProductController productController = Get.put(ProductController());

    return   SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SliderImage(imageUrl:product.image ,),
                    CustomIndicatorSmooth(controller: controller),
                    GetBuilder<ProductDetailesController>(
                           builder:(controller)
                           {
                             return Positioned(
                                 bottom: 30,
                                 right: 30,
                                 child: Container(
                                   height: 200,
                                   width: 50,
                                   padding: const EdgeInsets.all(8),
                                   decoration: BoxDecoration(
                                     color: Colors.black.withOpacity(0.3),
                                     borderRadius: BorderRadius.circular(30),
                                   ),
                                   child: ListView.separated(
                                       itemBuilder: (context,index)
                                       {
                                         return InkWell(
                                           onTap: ()
                                           {
                                             controller.onChangeColor(index: index);
                                           },
                                           child: ColorPicker(
                                               outBorder: controller.currentColor.value == index,
                                               color: controller.colorSelect[index]),
                                         );
                                       },
                                       separatorBuilder: (context,index)=>const SizedBox(height: 3),
                                       itemCount: controller.colorSelect.length),
                                 ));
                           }
                    ),
                    CustomBadgesShop(cartController: cartController),
                  ],
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTitleProduct(product: product),
                    CustomFavProduct(productController: productController, product: product),

                  ],
                ),
                 CustomRating(product: product),
                 CustomDesProductReadMoreText(description: product.description,),
                const SizeListProduct(),
                AddCartAndTotalPrice(
                  onPressed: ()
                  {
                    cartController.addProductToCart(product);
                  },
                  titleButton: 'Add To Cart',
                  totalPrice: 'Price',
                  price: '\$${product.price}',),
              ],
            ),
          ),
      ),
    );
  }
}






