import 'package:assro/logic/controllers/ProductController.dart';
import 'package:assro/view/screens/Product_detailes.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import 'CustomItemCard.dart';

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    return Obx(() {
      if (controller.isLoading.value == true) {
        return const Center(
            child: CircularProgressIndicator(color: AppColor.primaryColor,));
      } else {
       return Expanded(
          child: controller.searchList.isEmpty &&
              controller.searchController.text.isNotEmpty ?
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
            Icon(Icons.search_sharp,
              color: AppColor.primaryColor.withOpacity(0.4),
              size:150,),
            TextUtils(titleText: "Sorry !! \nIs Result Not Found ",
              style: Styles.textStyle18.copyWith(
                color: Colors.red,
              ), textAlign: TextAlign.center)

          ]):
          GridView.builder(
              itemCount: controller.searchList.isNotEmpty ?
              controller.searchList.length : controller.productList.length,
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 9.0,
              ),
              itemBuilder: (context, index) {
                if(controller.searchList.isEmpty)
                {
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
                        image: controller.productList[index].image,
                        price: controller.productList[index].price,
                        rate:  controller.productList[index].rating.rate,
                        productId: controller.productList[index].id,
                        product: controller.productList[index],
                        onTap: ()
                        {
                          Get.to(ProductDetailes(product: controller.productList[index]));
                        },
                      ),
                    ),
                  );
                } else{
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
                        image: controller.searchList[index].image,
                        price: controller.searchList[index].price,
                        rate:  controller.searchList[index].rating.rate,
                        productId: controller.searchList[index].id,
                        product: controller.searchList[index],
                        onTap: ()
                        {
                          Get.to(ProductDetailes(product: controller.searchList[index]));
                        },
                      ),
                    ),
                  );
                }

              }),
        );
      }

    });
  }
}

