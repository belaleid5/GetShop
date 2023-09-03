import 'package:assro/logic/controllers/CartController.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/MainController.dart';
import '../../../routes/RouteNamed.dart';
import '../../../utils/constant/color.dart';
import 'package:badges/badges.dart'as badges;
import '../../../utils/constant/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.titleAppBar,
  });
  final String titleAppBar;

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    CartController cartController = Get.put(CartController());

    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title:  Text(controller.titleTabs[controller.currentIndex.value]),
        centerTitle: true,
        actions: [
          Padding(padding:const EdgeInsets.only(top: 10,right: 15),
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            showBadge: true,
            ignorePointer: false,
            badgeContent: Text(cartController.quantity().toString(),style: Styles.textStyle16.copyWith(
                color: AppColor.whiteColor,
                fontSize: 10
            ),),
            badgeAnimation: const badges.BadgeAnimation.rotation(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.red,
              padding: const EdgeInsets.all(7),
              borderRadius: BorderRadius.circular(4),
              elevation: 0,
            ),
            child:IconButton(
                onPressed: ()
                {
                  Get.toNamed(RouteName.cartScreen);
                }, icon: const Icon(Icons.shop,size:32,
              color: AppColor.whiteColor,)),
          ),

          ),
   ]),
    ));

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);

}
