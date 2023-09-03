import 'package:assro/logic/controllers/auth/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../utils/constant/color.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return GetBuilder<SignUpController>(
      builder: (context) {
        return InkWell(
          onTap: ()
          {
             controller.checkBox();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            padding:const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColor.thirdColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child:controller.isCheckBox ?  const Icon(Icons.check,size: 30,
              color: AppColor.primaryColor,
            ):Container(   margin: const EdgeInsets.all(5),
                padding:const EdgeInsets.all(10),
           ),
          ),
        );
      }
    );
  }
}
