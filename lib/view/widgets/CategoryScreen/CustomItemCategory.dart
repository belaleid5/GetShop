import 'package:assro/logic/controllers/CategoryController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';
import 'CustomCartItem.dart';

class CustomItemCategory extends StatelessWidget {
  const CustomItemCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    return Obx(()
    {
       if(controller.isCategoriesLoading.value != false)
       {
         return const Center(child: CircularProgressIndicator(color: AppColor.primaryColor,));
       } else{
         return Expanded(
           child: ListView.separated(itemBuilder: (context,index)
           {
             return   InkWell(
               onTap: ()
               {
                 controller.getCategoryIndex(index);
                 Get.to(()=>const CustomCartItem());

               },
               child: Container(
                   height: 150,
                   width: double.infinity,
                   decoration:  BoxDecoration(
                       borderRadius: BorderRadius.circular(16),
                       image:  DecorationImage(image:
                       NetworkImage(controller.imageListCategory[index],),
                         fit: BoxFit.fill,
                       )
                   ),
                   child:  Padding(
                     padding: const EdgeInsets.only(left:8.0,bottom:8),
                     child: Align(
                       alignment:Alignment.bottomLeft,
                       child: TextUtils(
                           titleText: controller.categoriesList[index],
                           style: Styles.textStyle16.copyWith(
                             backgroundColor: AppColor.blackColor.withOpacity(0.3),
                             color: AppColor.whiteColor,
                           ),
                           textAlign: TextAlign.left
                       ),
                     ),
                   )
               ),
             ) ;


           },
               separatorBuilder: (context,index)=>const SizedBox(height: 10,),
               itemCount: controller.categoriesList.length),
         );
       }
    });
  }
}