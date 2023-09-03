import 'package:assro/utils/constant/color.dart';
import 'package:assro/utils/constant/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomDesProductReadMoreText extends StatelessWidget {
  const CustomDesProductReadMoreText({
    super.key, required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 5,bottom: 10),
      child: ReadMoreText(
        description,
        trimLines: 2,
        colorClickableText: AppColor.primaryColor,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        style:Styles.textStyle14.copyWith(
          textBaseline: TextBaseline.alphabetic,
          height: 2,
        ),
        moreStyle: Styles.textStyle14.copyWith(
          color: AppColor.primaryColor,
        ),

      ),
    );
  }
}
