import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/SettingsController.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';

class CustomLogout extends StatelessWidget {
  const CustomLogout({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (context) {
        return InkWell(
          onTap: ()
          {
            Get.defaultDialog(
              title: '4'.tr,
              content: const Text('Are you sure you want to logout?'),
              confirm: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                onPressed: () {
                  controller.signOut();
                },
                child:  Text('4'.tr),
              ),
              cancel: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
            );
          },
          child: Row(
              children:[
                 Container(
                  padding : const  EdgeInsets.all(10),
                  margin  : const  EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.blue
                  ),

                  child: const Icon(Icons.logout,color: AppColor.whiteColor,),
                ),
                 Text('4'.tr,style: Styles.textStyle20,),
              ]),
        );
      }
    );
  }
}