import 'package:assro/view/screens/FavoriteScreen.dart';
import 'package:assro/view/screens/HomeScreen.dart';
import 'package:get/get.dart';

import '../../view/screens/CategoryScreen.dart';
import '../../view/screens/SettingScreen.dart';

class MainController extends GetxController
{
  RxInt currentIndex = 0.obs;
  final tabs = [
        const HomeScreen(),
        const CategoryScreen(),
        const FavoriteScreen(),
        const SettingsScreen(),
  ].obs ;

  final titleTabs =
  [
      "Get Shop",
      "Category",
      "Favorite",
      "2".tr,


  ].obs;



  
}