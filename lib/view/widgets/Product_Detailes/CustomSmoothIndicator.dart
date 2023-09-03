import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/controllers/ProductDetailes_controller.dart';
import '../../../utils/constant/color.dart';

class CustomIndicatorSmooth extends StatelessWidget {
  const CustomIndicatorSmooth({
    super.key,
    required this.controller,
  });

  final ProductDetailesController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailesController>(
        builder: (context) {
          return Positioned(
            bottom:30,
            left:180,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect:  const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor:AppColor.primaryColor ,
                dotColor: AppColor.secondColor,

              ),
            ),

          );
        }
    );
  }
}
