import 'package:assro/logic/controllers/CategoryController.dart';
import 'package:assro/logic/controllers/ProductController.dart';
import 'package:assro/view/widgets/MainScreen/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../screens/Product_detailes.dart';
import '../HomeScreen/CustomItemCard.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    CategoryController catController = Get.put(CategoryController());
    return Scaffold(
      appBar:  const CustomAppBar(titleAppBar: "Item Category",),
      body:  Obx(()
      {
        if(catController.isCategoriesItemLoading.value !=false )
        {
          return const Center(child: CircularProgressIndicator(color: AppColor.primaryColor,));
        } else{
          return   GridView.builder(
              itemCount: catController.categoriesItemsName.length,
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 9.0,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.thirdColor.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0,
                          )


                        ]
                    ),
                    child: CustomItemCard(
                      image: catController.categoriesItemsName[index].image,
                      price: catController.categoriesItemsName[index].price,
                      rate:  catController.categoriesItemsName[index].rating.rate,
                      productId: catController.categoriesItemsName[index].id,
                      product: catController.categoriesItemsName[index],
                      onTap: ()
                      {
                        Get.to(ProductDetailes(product: catController.categoriesItemsName[index]));
                      },
                    ),
                  ),
                );
              });
        }


      }
        ),
    );
  }
}
