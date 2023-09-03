import 'package:flutter/cupertino.dart';
import '../../utils/constant/styles.dart';
import '../widgets/CategoryScreen/CustomItemCategory.dart';
import '../widgets/WelcomeScreen/TextUtils.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(titleText: "Category", style: Styles.textStyle30,
              textAlign: TextAlign.left),
          SizedBox(height: 20,),
          CustomItemCategory()
        ],


      ),
    );
  }
}

