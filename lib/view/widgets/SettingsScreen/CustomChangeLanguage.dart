import 'package:assro/logic/controllers/SettingsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/Functions/string.dart';
import '../../../utils/constant/color.dart';
import '../../../utils/constant/styles.dart';

class CustomChangeLanguage extends StatelessWidget {
  const CustomChangeLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return GetBuilder<SettingsController>(
      builder: (context) {
        return Row(
            children:[
              Container(
                padding : const  EdgeInsets.all(10),
                margin  : const  EdgeInsets.only(top: 10, bottom: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.pinkAccent
                ),

                child: const Icon(Icons.language,color: AppColor.whiteColor,),
              ),
               Text('3'.tr,style: Styles.textStyle20,),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(12),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColor.blackColor,
                    width:1.5,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      iconSize: 25,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: [
                        DropdownMenuItem(
                          value: ar,
                          child: Text(arabic,style: Styles.textStyle16,),
                        ),
                        DropdownMenuItem(
                          value: en,
                          child: Text(english,style: Styles.textStyle16,),
                        ),
                      ],
                      value: controller.langLocal,
                      onChanged: (newValue)
                      {
                        controller.changeLang(newValue!);
                        Get.updateLocale(Locale(newValue));
                      }),

                ) ,
              ),


            ]);
      }
    );
  }
}
