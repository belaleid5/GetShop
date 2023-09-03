import 'package:assro/logic/controllers/auth/ForgetPasswordController.dart';
import 'package:assro/utils/constant/styles.dart';
import 'package:assro/view/widgets/Auth/SignUp/CustomAppBarAuth.dart';
import 'package:assro/view/widgets/WelcomeScreen/CustomButtonStart.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/Functions/vaildInput.dart';
import '../../../utils/constant/color.dart';
import '../../widgets/Auth/ForgetPassword/CustomButtonCancel.dart';
import '../../widgets/Auth/ForgetPassword/CustomImage.dart';
import '../../widgets/Auth/SignUp/CustomFormFieldAuth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return   Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
          children:  [
               const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppBarAuth(
                      titleAppBarOne: "Forget",
                      titleAppBarTow: "Password",
                  ),
                  CustomButtonCancel(),
                ],
              ),
               const TextUtils(
                  titleText: "If  You Want To Recover Your account,"
                  " Then Please Provide Your Email ID Below",
                  style: Styles.textStyle16, textAlign: TextAlign.center,),
               const SizedBox(height: 30,),
                const CustomImage(
                  heightImage: 200,
                  image: 'assets/images/019-drawkit-support-man-colour.svg',
                  color: AppColor.primaryColor,),
              const SizedBox(height: 50,),

            CustomFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 6, 40, "email");
                },
              hintText: 'Email',
              iconData: Icons.mail,
              myController:controller.emailController ),
               GetBuilder<ForgetPasswordController>(
                 builder: (context) {
                   return Padding(
                   padding: const EdgeInsets.only(left: 18.0,right: 18,top: 10),
                   child: CustomButton(
                    onPressed:() {
                                     controller.resetPassword(email: controller.emailController.text.trim());
                    },
                    titleButton: "Send ",
                    heightButton: 65,
                    widthButton: 140,
              ),
            );
                 }
               ),
          ],
        ),
      ),

    );
  }
}


