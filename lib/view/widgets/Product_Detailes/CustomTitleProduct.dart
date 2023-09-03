import 'package:flutter/cupertino.dart';
import '../../../model/product_model.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';


class CustomTitleProduct extends StatelessWidget {
  const CustomTitleProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextUtils(
            titleText: product.title ,
            style: Styles.textStyle16.copyWith(
              overflow: TextOverflow.ellipsis,
            ), textAlign: TextAlign.left),),
    );
    
  }
}