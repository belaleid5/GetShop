import 'package:assro/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/RouteNamed.dart';
import '../../utils/constant/color.dart';
class CartController  extends GetxController
{
    var productMap = {}.obs;
    void addProductToCart(Product product)
    {
      if(productMap.containsKey(product))
      {
        productMap[product] += 1;
      } else{
        productMap[product] = 1;
      }
    }
       void removeProductsFormCart(Product product) {
              if(productMap.containsKey(product) && productMap[product] == 1)
              {
                productMap.removeWhere((key, value) => key == product);
              }   else{
                productMap[product] -= 1;
              }
       }
        void removeOneProduct(Product product) {
          productMap.removeWhere((key, value) => key == product);
        }

        void clearAllProducts()
        {
          Get.defaultDialog(
              backgroundColor: AppColor.secondColor,
              buttonColor:AppColor.primaryColor,
              confirmTextColor: AppColor.whiteColor,
              cancelTextColor: AppColor.primaryColor,
              titleStyle: const TextStyle(color: AppColor.primaryColor),

              title: 'Clear Products !',
              content: const Text('Are You Sure Clear Products',style: TextStyle(
                  color: AppColor.primaryColor
              ),),
              textConfirm: 'Yes',
              middleText: "No",
              onConfirm: () {
                productMap.clear();
                Get.back();
              },
              onCancel: ()
              {
                  Get.toNamed(RouteName.cartScreen);
              }
          );
        }
      get total => productMap.entries.map((e) => e.key.price * e.value)
          .toList().reduce((value, element) => value + element).toStringAsFixed(2);

    get  productSubTotal => productMap.entries.map((e) => e.key.price * e.value).toList();

    int quantity ()
    {
      if(productMap.isEmpty)
      {
            return 0;
      }  else{
        return productMap.entries.map((e) => e.value).
        toList().reduce((value, element) => value + element);
      }

    }




}