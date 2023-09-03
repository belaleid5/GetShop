import 'package:assro/logic/controllers/MainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constant/color.dart';
import '../widgets/MainScreen/BottumNavBar.dart';
import '../widgets/MainScreen/CustomAppBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.put(MainController());
    return   Obx(() =>  Scaffold(
        appBar:  const CustomAppBar(titleAppBar: 'Home Screen',),
        bottomNavigationBar:const CustomBottomNavBar(),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs,
      )),
    );
  }
}


