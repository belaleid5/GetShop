import 'package:assro/logic/controllers/ProductDetailes_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';

class SizeListProduct extends StatelessWidget {
  const SizeListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailesController controller = Get.put(ProductDetailesController());
    return GetBuilder<ProductDetailesController>(
      builder: (context) {
        return Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)
              {
                return GestureDetector(
                    onTap:()
                    {
                      controller.onSelectSize(index: index);
                    } ,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration: BoxDecoration(
                          color: controller.currentSize.value == index ?  AppColor.primaryColor.withOpacity(0.4) :
                          AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                            width: 2
                          )
                        ),
                        child: Text(controller.sizeList[index],style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                        ),),));
              },
              separatorBuilder: (context,index)=>const SizedBox(width: 10,),
              itemCount:controller.sizeList.length),
        );
      }
    );
  }
}
