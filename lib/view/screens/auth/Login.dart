import 'package:assro/view/widgets/WelcomeScreen/CustomButtonStart.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/auth/LogInController.dart';
import '../../../utils/Functions/vaildInput.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../../widgets/Auth/LogIn/AuthSocial.dart';
import '../../widgets/Auth/SignUp/CustomAppBarAuth.dart';
import '../../widgets/Auth/SignUp/CustomFormFieldAuth.dart';
import '../../widgets/Auth/SignUp/UnderContainer.dart';
import '../../widgets/WelcomeScreen/CustomTextButton.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    LogInController controller = Get.put( LogInController());
    return    Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
               const CustomAppBarAuth(titleAppBarOne: 'LOG', titleAppBarTow: 'IN',),
              CustomFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 6, 40, "email");
                },
                hintText: 'Email',
                iconData: Icons.mail,
                myController: controller.emailController,
              ),
              GetBuilder<LogInController>(
                builder: (context) {
                  return CustomFormFieldAuth(
                    validator: (val) {
                      return validInput(val!, 5, 40, "password");
                    },
                    hintText: 'Password',
                    obscureText: controller.isShowPassword,
                    iconData: controller.isShowPassword ?
                  Icons.visibility :
                  Icons.visibility_off,
                    onTap: ()
                    {
                      controller.showPassword();

                    },
                    myController: controller.passwordController,);
                }
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  titleAuthButton: 'Forget Password?',
                  onPressed: ()
                  {
                      controller.goToForgetPassword();
                  },
                  color:AppColor.blackColor.withOpacity(0.4) ,
                ),
              ),
               GetBuilder<LogInController>(
                 builder: (context) {
                   return Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 20),
                    child: CustomButton(
                      titleButton: "LogIn ",
                      heightButton: 56,
                      widthButton: 140,
                      onPressed: ()
                      {
                              controller.loginWithEmailAndPassword(
                              emailAddress:
                              controller.emailController.text.trim(),
                              password: controller.passwordController.text);
                    },
                    ),
              );
                 }
               ),
                const Padding(

                  padding: EdgeInsets.symmetric(vertical:18.0),
                  child: TextUtils(titleText: "OR", style: Styles.textStyle20,
                    textAlign: TextAlign.center,),
                ),
                const AuthSocial(),
              const SizedBox(
                height: 80,
              ),
              UnderContainer(titleAccount: 'Don`T Have An Account ? ', titleAuth: 'SignUp',
                  onPressed: () {
                  controller.goToSignUp();
                  },),
            ],),
        ),
      ),


    );
  }
}





