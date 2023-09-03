import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../logic/controllers/MainController.dart';
import '../../../utils/constant/color.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());

    return CurvedNavigationBar(
      index: controller.currentIndex.value,
      buttonBackgroundColor: AppColor.whiteColor,
      backgroundColor: AppColor.secondColor,
      items:  const <Widget>[
        Icon(Icons.home, size: 30,color: AppColor.primaryColor,),
        Icon(Icons.shopping_cart_rounded, size: 30,color:  AppColor.primaryColor,),
        Icon(Icons.favorite, size: 30,color: AppColor.primaryColor,),
        Icon(Icons.settings, size: 30,color:  AppColor.primaryColor,),
      ],
      onTap: (index) {
           controller.currentIndex.value = index;

      },
    );
  }
}
