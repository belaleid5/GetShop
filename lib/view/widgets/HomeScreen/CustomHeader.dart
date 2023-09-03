import 'package:flutter/cupertino.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';
import '../WelcomeScreen/TextUtils.dart';
import 'SearchForm.dart';

class CustomHeaderPage extends StatelessWidget {
  const CustomHeaderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width:double.infinity,
        decoration:  const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)) ,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                TextUtils(titleText: 'Find Your',
                  style: Styles.textStyle22.copyWith(
                    fontSize: 24,
                    color: AppColor.whiteColor,
                  ), textAlign: TextAlign.left,),
                TextUtils(titleText: 'INSPIRATION',
                  style: Styles.textStyle22.copyWith(
                    fontSize: 24,
                    color: AppColor.whiteColor,
                  ), textAlign: TextAlign.left,),
                const SizedBox(
                  height: 35,
                ),
                const SearchForm() ,
              ]
          ),
        )
    );
  }
}
