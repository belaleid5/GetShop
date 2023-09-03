import 'package:assro/routes/RouteNamed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';

class SignUpController extends GetxController
{
  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
    GlobalKey<FormState> formKey = GlobalKey();
    bool isShowPassword = true;
    bool isCheckBox= false;
    var displayName = '' ;


    checkBox() {

        isCheckBox = !isCheckBox;
        update();

    }

    showPassword () {
         isShowPassword = isShowPassword == true ? false : true;
         update();
    }

 goToLogin() {
   Get.offNamed(RouteName.logIn);

 }
  createUser({
    required String name,
    required String emailAddress,
    required String password,
  })
  async {
      if(isCheckBox == false)
      {

        Get.snackbar(
          "Check box",
          "I accept terms & condition",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.secondColor,
          colorText: AppColor.blackColor,

        );
      }
      else if(formKey.currentState!.validate())
    {
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
    ).then((value) =>
    {
      displayName = name,
    FirebaseAuth.instance.currentUser!.updateDisplayName(name),
    });
    update();
    Get.offNamed(RouteName.mainScreen);
    } on FirebaseAuthException catch (error) {
    String title = error.code.replaceAll("-", " ") ;
    String message  = '' ;
    if (error.code == 'Weak Password') {
    message = 'The Password Provided Is Too Weak.';
    } else if (error.code == 'Email Already In Use') {
    message = 'The Account Already Exists For That Email.';
    }else{
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
  void onInit() {
    userController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
     userController = TextEditingController();
     emailController = TextEditingController();
     passwordController = TextEditingController();
    super.dispose();
  }



}