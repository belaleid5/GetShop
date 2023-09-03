import 'package:assro/model/FaceBook_Model.dart';
import 'package:assro/utils/constant/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../routes/RouteNamed.dart';

class LogInController extends GetxController
{
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isShowPassword = true;
  var displayUserName = ''.obs ;
  var displayUserPhoto = ''.obs ;
  var displayUserEmail = ''.obs ;
  GlobalKey<FormState> formKey = GlobalKey();
  var signInGoogle = GoogleSignIn();
  FaceBookModel ? faceBookModel;
  var isLogin = false;
  final GetStorage  authStorage = GetStorage();
  User? get userProfile => FirebaseAuth.instance.currentUser;



  showPassword () {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
  goToSignUp() {
    Get.offNamed(RouteName.signUp);

  }
  goToForgetPassword() {
    Get.toNamed(RouteName.forgetPassword);

  }
loginWithEmailAndPassword({required String emailAddress, required String  password})
async{
      if(formKey.currentState!.validate())
      {
        try {
             await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress,
              password: password
          ).then((value) => displayUserName.value =
          FirebaseAuth.instance.currentUser!.displayName!);
          isLogin  = true;
          authStorage.write('auth', isLogin);
          update();
          Get.offNamed(RouteName.mainScreen);
        } on FirebaseAuthException catch (error) {
          String title = error.code.replaceAll("-", " ") ;
          String message  = '' ;
          if (error.code == 'user-not-found') {
            message= 'No user found for that email.';
          } else if (error.code == 'wrong-password') {
            message = 'Wrong password provided for that user.';
          }  else{
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



googleSingIn() async{
    try {
      final GoogleSignInAccount? googleUser = await signInGoogle.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;
           GoogleSignInAuthentication googleSignInAuthentication =
              await googleUser.authentication;
             final AuthCredential authCredential = GoogleAuthProvider.credential(
                idToken: googleSignInAuthentication.idToken,
                accessToken:googleSignInAuthentication.accessToken,
             ) ;

           await FirebaseAuth.instance.signInWithCredential(authCredential);
      isLogin  = true;
      authStorage.write('auth', isLogin);

      update();
      Get.offNamed(RouteName.mainScreen);
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
  signInWithFacebook() async{
    try {
      Future<UserCredential> signInWithFacebook() async {
        // Trigger the sign-in flow
        final LoginResult loginResult = await FacebookAuth.instance.login();
        // Create a credential from the access token
        var data = await FacebookAuth.instance.getUserData();
        faceBookModel = FaceBookModel.fromJson(data);
        print("${faceBookModel!.email}") ;
        print("${faceBookModel!.id}") ;
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
        // Once signed in, return the UserCredential
        return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      }
      isLogin  = true;
      authStorage.write('auth', isLogin);
      // Get.offNamed(RouteName.mainScreen);
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

  @override
  void onInit() {
    displayUserName.value =  (userProfile != null ?
    userProfile!.displayName : "")!;
    displayUserPhoto.value = (userProfile != null ? userProfile!.photoURL : "")!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : "")!;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.dispose();
  }



}