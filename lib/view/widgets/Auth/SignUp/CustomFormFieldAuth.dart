import 'package:flutter/material.dart';
import '../../../../utils/constant/color.dart';
import '../../../../utils/constant/styles.dart';

class CustomFormFieldAuth extends StatelessWidget {
  const CustomFormFieldAuth({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.myController,
     required this.validator,
     this.onTap,
     this.obscureText ,
  });


  final String hintText;
  final IconData iconData;
  final String ? Function(String?) validator;
  final TextEditingController myController;
  final void Function()? onTap;
  final bool ? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true ,
        controller: myController,
        validator:validator,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right:  8.0,left: 8),
            child: InkWell(
              onTap: onTap,
              child: Icon(iconData,size: 35,color: AppColor.primaryColor,),
            )
          ),
          hintText: hintText,
          hintStyle: Styles.textStyle16.copyWith(
            color: AppColor.thirdColor.withOpacity(0.6),
          ),
          filled: true,
          fillColor: AppColor.thirdColor.withOpacity(0.2),
          contentPadding: const EdgeInsets.symmetric(vertical: 22),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),

          ),
        ),

      ),
    );
  }
}
