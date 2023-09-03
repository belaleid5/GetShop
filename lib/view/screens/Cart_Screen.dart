import 'package:assro/logic/controllers/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controllers/Payment_controller.dart';
import '../widgets/CartScreen/CartProduct.dart';
import '../widgets/CartScreen/Cart_total.dart';
import '../widgets/CartScreen/CustomAppBarNormal.dart';
import '../widgets/CartScreen/Empty_cart.dart';
import 'Payment.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    CartController controllerCart = Get.put(CartController());
    PaymentController paymentController = Get.put(PaymentController());
    return    Scaffold(
      appBar:  const CustomAppNormal(),
      body: Obx((){
        if(controllerCart.productMap.isEmpty)
        {
          return const CustomCartEmpty();
        }   else{
          return  SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: (context, index)
                      {
                        return  CardProduct(
                          index: index,
                          product: controllerCart.productMap.keys.toList()[index],
                          quantity: controllerCart.productMap.values.toList()[index],);
                      },
                      separatorBuilder: (context,index)
                      {
                        return const SizedBox(height: 15,);
                      }, itemCount: controllerCart.productMap.length),
                ),
                 AddCartAndTotalPrice(
                   onPressed: ()
                   {
                          Get.to(const PaymentScreen());
                      },
                   titleButton: 'Check Out',
                   totalPrice: '\$${controllerCart.total}',
                   price: 'Total',)
              ],
            ),
          );
        }
      }
         ),
      // CustomCartEmpty(),

    );
  }
}




