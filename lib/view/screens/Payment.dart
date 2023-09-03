
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Functions/vaildInput.dart';
import '../../logic/controllers/Payment_controller.dart';
import '../widgets/Auth/SignUp/CustomAppBarAuth.dart';
import '../widgets/Auth/SignUp/CustomFormFieldAuth.dart';
import '../widgets/WelcomeScreen/CustomButtonStart.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});



  @override
  Widget build(BuildContext context) {
    PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      body: SafeArea(
        child: Form(
          key:controller.formKey,
          child: ListView(
            children: [
              const CustomAppBarAuth(
                titleAppBarOne: 'Payment ',
                titleAppBarTow: 'Integration',
              ),
              CustomFormFieldAuth(
                hintText: 'FirstName',
                iconData: Icons.person,
                myController: controller.userController,
                validator: (val) {
                  return validInput(val!, 3, 40, "username");
                },
              ),
              CustomFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 8, 40, "email");
                },
                hintText: 'Email',
                iconData: Icons.mail,
                myController: controller.emailController,
              ),
              CustomFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 5, 40, "phone");

                },
                hintText: 'phone',
                iconData:Icons.phone,
                myController: controller.phoneController,


              ),
              CustomFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 1, 40, "price");

                },
                hintText: 'price',
                iconData:Icons.phone,
                myController: controller.priceController,


              ),
               Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                child: CustomButton(
                   titleButton: "SignUp",
                   heightButton: 56,
                   widthButton: 140,
                   onPressed: () {
                   if(controller.formKey.currentState!.validate())
                   {

                     print("Belal");

                    }

                }
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
