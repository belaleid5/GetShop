import 'package:assro/logic/controllers/SettingsController.dart';
import 'package:assro/view/widgets/FavoriteScreen/CustomDivider.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Functions/string.dart';
import '../../utils/constant/color.dart';
import '../../utils/constant/styles.dart';
import '../widgets/SettingsScreen/CustomChangeLanguage.dart';
import '../widgets/SettingsScreen/CustomLogout.dart';
import '../widgets/SettingsScreen/CustomProfilePerson.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children:  [
           const CustomProfilePerson(),
           const CustomDivider(),
           const SizedBox(height: 10,),
           TextUtils(titleText: "1".tr, style: Styles.textStyle20.copyWith(
            color: AppColor.primaryColor,
          ), textAlign: TextAlign.left),
           const SizedBox(height: 10,),
           CustomLogout(controller: controller),
           const CustomChangeLanguage(),
        ]),

    );

  }
}



