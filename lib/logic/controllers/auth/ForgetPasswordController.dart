import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constant/color.dart';

class ForgetPasswordController extends GetxController
{
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey();


  @override
  void onInit() {
    emailController = TextEditingController();
super.onInit();
  }


  resetPassword({required String email})
  async{
    if(formKey.currentState!.validate())
    {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail
          (email: email);
        update();
        Get.back();
      } on FirebaseAuthException catch (error) {
        String title = error.code.replaceAll("-", " ") ;
        String message  = '' ;
        if (error.code == 'user-not-found') {
          message= 'No user found for that $email.';
        }   else{
          message =error.message.toString();
        }
        Get.snackbar(
          title,
          message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.secondColor,
          colorText: AppColor.blackColor,

        );
      } catch (error) {
        Get.snackbar(
          "ERROR!",
          error.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.secondColor,
          colorText: AppColor.blackColor,

        );
      }
    }
  }

  @override
  void dispose() {
   emailController.dispose();
   super.dispose();
  }

}