import 'package:assro/logic/controllers/ProductController.dart';
import 'package:assro/utils/constant/color.dart';
import 'package:assro/utils/constant/styles.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/FavoriteScreen/CardItem.dart';
import '../widgets/FavoriteScreen/CustomDivider.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    return Obx(() {
      if (controller.favoriteList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/heart.png",
              height: 200,
                color: AppColor.primaryColor.withOpacity(0.3),
              ),
              const SizedBox(height: 20,),
              const TextUtils(
                  titleText: 'Please Add Product Items ',
                  style: Styles.textStyle16,
                  textAlign: TextAlign.center) ,
            ],
          ),
        );
      } else {
        return ListView.separated(
            itemBuilder: (context, index) {
              return CardItem(
                image: controller.favoriteList[index].image,
                title: controller.favoriteList[index].title,
                price: controller.favoriteList[index].price,
                productId: controller.favoriteList[index].id,
              );
            },
            separatorBuilder: (context, index) {
              return const CustomDivider();
            },
            itemCount: controller.favoriteList.length);
      }
    });
  }
}