import 'package:assro/logic/controllers/ProductDetailes_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'CustomSmoothIndicator.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    ProductDetailesController controller = Get.put(ProductDetailesController());
    return  CarouselSlider.builder(
      itemCount:3,
      carouselController: carouselController,
      options: CarouselOptions(
          height: 500,
          aspectRatio: 16/9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reson)
          {
            controller.onPageChanged(index);
          }

      ),
      itemBuilder: (BuildContext context, int index, int realIndex)
      {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(imageUrl),fit: BoxFit.fill),
          ),
        );

      },
    );


  }
}

