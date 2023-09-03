import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart'as badges;
import '../../../logic/controllers/CartController.dart';
import '../../../routes/RouteNamed.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';

class CustomBadgesShop extends StatelessWidget
{
  const CustomBadgesShop({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Container(
      padding:const  EdgeInsets.only(top: 10,left: 25,right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(top: 4,right: 6,left:6),
              margin:const EdgeInsets.only(bottom:15),
              decoration:const  BoxDecoration(
                color: AppColor.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Padding(padding:const  EdgeInsets.only(left: 10),
                child: IconButton(onPressed: ()
                {
                  Get.back();
                },
                    icon:const
                    Icon(Icons.arrow_back_ios,color:AppColor.whiteColor)),),
            ),
          ),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            showBadge: true,
            ignorePointer: false,
            badgeContent: Text(cartController.quantity().toString(),
              style: Styles.textStyle16.copyWith(
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
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.only(top: 4,right: 6,left:6),
                margin:const EdgeInsets.only(bottom:15),
                decoration:const  BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
                child:       IconButton(onPressed: ()
                {
                  Get.toNamed(RouteName.cartScreen);
                },
                    icon:const  Icon(Icons.shopping_cart,
                        color:AppColor.whiteColor)),
              ),
            ),
          ),

        ],),
    ),);
  }
}
