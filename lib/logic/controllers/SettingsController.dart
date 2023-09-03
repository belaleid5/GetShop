import 'package:assro/routes/RouteNamed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../utils/Functions/string.dart';
import '../../utils/constant/color.dart';

class SettingsController extends GetxController
{
 GetStorage storage = GetStorage();
 var langLocal = en;
 var isLogin = false;

signOut()
  {
   try{
     FirebaseAuth.instance.signOut();
     GoogleSignIn().signOut();
     FacebookAuth.instance.logOut();
     Get.offAllNamed(RouteName.welcome);
     isLogin = false;
     storage.remove("auth");
     update();

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
 String capitalize(String profileName)
 {

   return profileName.split("").map((name) => name.capitalize).join("");
 }
void changeLang (String typeLange)
{
      savLang(typeLange);
      if(langLocal == typeLange)
      {
        return;
      }

      if(typeLange == ar)
      {
        langLocal = ar;
        savLang(ar);
      }  else{
        langLocal == en;
        savLang(en);
      }
      update();
}

 Future<String> get getLang async
 {
   return await storage.read("lang");
 }
void savLang(String lang)  async
{
  
     await storage.write("lang", lang);
}


@override
  void onInit() async{
     langLocal = await getLang;
     savLang(langLocal);
    super.onInit();
  }



}