import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class PaymentController extends GetxController
{
  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController priceController;
  GlobalKey<FormState> formKey = GlobalKey();



  Future<void> getTokenAuth()async {}

  @override
  void onInit() {
    userController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }


  @override



  void dispose() {
    userController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    priceController = TextEditingController();
    super.dispose();
  }
}