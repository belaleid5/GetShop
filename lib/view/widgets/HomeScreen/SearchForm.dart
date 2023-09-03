import 'package:assro/logic/controllers/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController()) ;
    return GetBuilder<ProductController>(builder: (_)
    {
      return TextField(
        controller: controller.searchController,
        decoration: InputDecoration(
          prefixIcon:const Icon(Icons.search),
          suffixIcon:controller.searchController.text.isNotEmpty ?
          IconButton(
            onPressed: ()
            {
              controller.clearSearchList();
            },
            icon: const Icon(Icons.clear,color: AppColor.blackColor,),):null,
           hintText: 'Search with title & price',
          contentPadding: const EdgeInsets.symmetric(vertical: 23),
          filled: true,
          fillColor: AppColor.whiteColor,
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColor.whiteColor,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColor.whiteColor,
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColor.whiteColor,
              )
          ),
        ),
         onChanged: (searchName)
         {
               controller.searchFormProduct(searchName);
         },
      );
    });
  }
}
