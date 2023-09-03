import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../model/product_model.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 20,bottom: 5),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextUtils(titleText: "${product.rating.rate}", style: Styles.textStyle14,
              textAlign: TextAlign.left),
          const SizedBox(width: 5,),
          RatingBarIndicator(
            rating:product.rating.rate,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
