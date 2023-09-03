import 'package:assro/Language/ar.dart';
import 'package:assro/utils/Functions/string.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'en.dart';

class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>>get keys=>
  {
     ar: arLang,
     en: enLang,
  } ;
}