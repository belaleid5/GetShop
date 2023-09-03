import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
     this.color,
    required this.heightImage,
  });

  final String image;
  final Color ?color;
  final double heightImage;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: heightImage,
      color: color,
    );
  }
}
