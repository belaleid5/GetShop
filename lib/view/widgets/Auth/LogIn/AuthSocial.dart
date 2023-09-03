import 'package:assro/logic/controllers/auth/LogInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../ForgetPassword/CustomImage.dart';

class AuthSocial extends StatelessWidget {
  const AuthSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LogInController controller = Get.put(LogInController());
    return  Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        GetBuilder<LogInController>(
          builder: (context) {
            return  InkWell(
              onTap:()
              {
                 controller.signInWithFacebook();
              } ,
              child: const CustomImage(
                heightImage: 50,
                image: 'assets/images/icons8-facebook-circled.svg',
              ),
            );
          }
        ),
        const SizedBox(width:10),
        GetBuilder<LogInController>(
          builder: (context) {
            return  InkWell(
              onTap: ()
              {
                   controller.googleSingIn();
              },
              child: const CustomImage(
                heightImage: 50,
                image: 'assets/images/icons8-google.svg',
              ),
            );
          }
        ),
      ],
    );
  }
}