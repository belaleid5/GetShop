import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/constant/color.dart';

class ProductDetailesController extends GetxController{
  final _currentPage = 0.obs;
  final  currentColor = 0.obs;
  final  currentSize = 0.obs;
  int get currentPage => _currentPage.value;
  List<Color> colorSelect = [
        AppColor.kCOlor1,
        AppColor.kCOlor2,
        AppColor.kCOlor3,
        AppColor.kCOlor4,
        AppColor.kCOlor5,
      ];

  List<String> sizeList = [
    "S","M","L","XL","XXL",

  ];


  void onPageChanged(int index) {
    _currentPage.value = index;
    update();
  }

  void onChangeColor({required int index}) {
    currentColor.value = index;
    update();
  }
  void onSelectSize({required int index}) {
    currentSize.value = index;
    update();
  }

}