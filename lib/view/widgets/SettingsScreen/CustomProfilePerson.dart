import 'package:assro/logic/controllers/SettingsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../logic/controllers/auth/LogInController.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';

class CustomProfilePerson extends StatelessWidget {
  const CustomProfilePerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    LogInController loginController = Get.put(LogInController());
    return Obx(()=>Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20,),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              image:  DecorationImage(
                  image: NetworkImage(
                    loginController.displayUserPhoto.value,
                  ),
                  fit: BoxFit.cover)
          ),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(titleText: controller.capitalize(loginController.displayUserName.value),
                style: Styles.textStyle16.copyWith(
                  fontSize: 18,
                ), textAlign: TextAlign.start),
            TextUtils(titleText: loginController.displayUserEmail.value,
                style: Styles.textStyle14, textAlign: TextAlign.start),
          ],),


      ],));
  }
}
