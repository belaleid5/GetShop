import 'package:assro/view/screens/HomeScreen.dart';
import 'package:assro/view/screens/WelcomeScreen.dart';
import 'package:assro/view/screens/auth/ForgetPaassowrd.dart';
import 'package:assro/view/screens/MainScreen.dart';
import 'package:assro/view/screens/auth/SignUP.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/screens/Cart_Screen.dart';
import '../view/screens/auth/Login.dart';
import 'RouteNamed.dart';

class AppRouter
{


  static List<GetPage<dynamic>>? getPages =
  [
     GetPage(name: RouteName.welcome, page: ()=>const WelcomeScreen()),
     GetPage(name: RouteName.signUp, page: ()=>const SignUp()),
     GetPage(name: RouteName.logIn, page: ()=>const LogIn()),
     GetPage(name: RouteName.forgetPassword, page: ()=>const ForgetPassword()),
     GetPage(name: RouteName.mainScreen, page: ()=>const MainScreen()),
     GetPage(name: RouteName.cartScreen, page: ()=> CartScreen()),
     GetPage(name: RouteName.homeScreen, page: ()=>const HomeScreen()),

  ] ;



}
