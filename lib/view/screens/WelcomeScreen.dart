import 'package:assro/utils/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../routes/RouteNamed.dart';
import '../../utils/constant/color.dart';
import '../widgets/WelcomeScreen/CustomButtonStart.dart';
import '../widgets/WelcomeScreen/CustomTextButton.dart';
import '../widgets/WelcomeScreen/CustomTextWlcome.dart';
import '../widgets/WelcomeScreen/TextGetShop.dart';
import '../widgets/WelcomeScreen/TextUtils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTextWelcome(),
        const SizedBox(height: 20,),
        const TextGetShop(),
        const SizedBox(height: 170),
          CustomButton(
            titleButton: "Get Start",
           heightButton: 65,
           widthButton: 250,
           onPressed: ()
           {
           Get.offNamed(RouteName.logIn);

           },
            ),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextUtils(
            titleText: "Don`T Have An Account ?",
              style:Styles.textStyle16.copyWith(
              ), textAlign: TextAlign.center ,),
             CustomTextButton(titleAuthButton: 'SignUp', onPressed: ()
             {
               Get.offNamed(RouteName.signUp);
             }, color: AppColor.primaryColor,)
        ],),
      ],
    ));
  }
}




