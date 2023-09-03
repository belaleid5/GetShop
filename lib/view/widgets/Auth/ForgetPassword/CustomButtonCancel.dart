import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonCancel extends StatelessWidget {
  const CustomButtonCancel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: ()
    {
      Get.back();
    },
        icon:const Icon(Icons.highlight_remove,size: 30,));
  }
}
