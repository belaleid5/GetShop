import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/CartController.dart';
import '../../../utils/constant/color.dart';

class CustomAppNormal extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppNormal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());

    return AppBar(
      title: const Text("Cart Items"),
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: ()
            {
                controller.clearAllProducts();
             },
            icon: const Icon(Icons.backspace_rounded))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(56.0);
}
