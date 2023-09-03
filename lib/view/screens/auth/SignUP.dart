import 'package:assro/logic/controllers/auth/SignUpController.dart';
import 'package:assro/view/widgets/WelcomeScreen/CustomButtonStart.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Functions/vaildInput.dart';
import '../../../utils/constant/styles.dart';
import '../../widgets/Auth/SignUp/CustomAppBarAuth.dart';
import '../../widgets/Auth/SignUp/CustomCheckBox.dart';
import '../../widgets/Auth/SignUp/CustomFormFieldAuth.dart';
import '../../widgets/Auth/SignUp/UnderContainer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});



  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      body: SafeArea(
        child: Form(
          key:controller.formKey,
          child: ListView(
            children: [
              const CustomAppBarAuth(
                titleAppBarOne: 'SIGN',
                titleAppBarTow: 'UP',
              ),
              CustomFormFieldAuth(
                hintText: 'UserName',
                iconData: Icons.person,
                myController: controller.userController,
                validator: (val) {
                  return validInput(val!, 3, 40, "username");
                },
              ),
             CustomFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 8, 40, "email");
                },
                hintText: 'Email',
                iconData: Icons.mail,
                myController: controller.emailController,
              ),
              GetBuilder<SignUpController>(
                  builder: (context) {
                    return CustomFormFieldAuth(
                      obscureText:controller.isShowPassword ,
                      validator: (val) {
                        return validInput(val!, 5, 40, "password");
                        
                      },
                      hintText: 'Password',
                      onTap: ()
                      {
                        controller.showPassword();

                      },
                      iconData: controller.isShowPassword ?
                      Icons.visibility :
                      Icons.visibility_off,
                      myController: controller.passwordController,
                    );
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  CustomCheckBox(),
                  SizedBox(
                    width: 10,
                  ),
                  TextUtils(
                      titleText: "I accept terms & condition",
                      style: Styles.textStyle16, textAlign: TextAlign.center,),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
                 GetBuilder<SignUpController>(
                   builder: (context) {
                     return Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                      child: CustomButton(
                        titleButton: "SignUp",
                       heightButton: 56,
                         widthButton: 140,
                        onPressed: () {
                                     controller.createUser(
                                         name:controller.userController.text.trim() ,
                                         emailAddress: controller.emailController.text.trim(),
                                         password:controller.passwordController.text
                                     );

                      }
                      ),
                );
                   }
                 ),
              const SizedBox(
                height: 80,
              ),
              UnderContainer(
                titleAccount: 'Already Have An Account ? ',
                titleAuth: 'LogIn',
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
