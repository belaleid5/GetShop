import 'package:assro/logic/controllers/ProductController.dart';
import 'package:assro/view/widgets/HomeScreen/CustomIconButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.productId,
  });
    final String  image;
    final String  title;
    final double  price;
    final int   productId;

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        width:double.infinity,
        child: Row(
          children: [
            Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(12),
                ),
                child: AspectRatio(
                  aspectRatio:1,
                  child:Image.network(image,
                    fit: BoxFit.cover,
                  ),
                )

            ),
              Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextUtils(
                        titleText:  title, style: Styles.textStyle16.copyWith(
                        overflow: TextOverflow.ellipsis

                    ), textAlign: TextAlign.center),
                  ),
                  TextUtils(titleText: "\$$price", style: Styles.textStyle16, textAlign: TextAlign.center)
                ],),
              ),
            const Spacer(),
             CustomIconButton(
                         onPressed: ()
                         {
                           controller.mangeIsFavorite(productId);
                         },
                 icon: Icon(Icons.favorite,color:AppColor.primaryColor)),
          ],
        ),
      ),
    );
  }
}
