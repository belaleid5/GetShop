import 'package:assro/utils/constant/styles.dart';
import 'package:assro/view/widgets/WelcomeScreen/TextUtils.dart';
import 'package:flutter/material.dart';
import '../widgets/HomeScreen/CardIems.dart';
import '../widgets/HomeScreen/CustomHeader.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child:Column(
            children:
            [
              CustomHeaderPage(),
              Padding(
                padding: EdgeInsets.only(top: 18.0,left: 18,bottom: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextUtils(
                    titleText: "Categories",
                    style: Styles.textStyle20, textAlign: TextAlign.left,),
                ),
              ),
              CardItems(),
            ],)),
    );
  }
}






