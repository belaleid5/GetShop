import 'package:assro/routes/AppRoutes.dart';
import 'package:assro/utils/Functions/string.dart';
import 'package:assro/view/screens/MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'Language/Localization.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>("lang").toString()),
      translations: LocalizationApp(),
      fallbackLocale: Locale(en),
      theme: ThemeData(
      ),
          home: const MainScreen(),
          getPages:AppRouter.getPages,
    );
  }
}
