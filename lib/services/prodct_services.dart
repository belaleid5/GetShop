import 'package:assro/utils/Functions/string.dart';
import 'package:http/http.dart'as http;

import '../model/product_model.dart';

class ProductServices
{

 static Future <List<Product>> getAllProduct()
 async {
   var response = await http.get(Uri.parse("$basUrl/products"));
     if(response.statusCode == 200)
     {
       var jsonData = response.body;
       return productFromJson(jsonData);
     }else{
       return throw Exception(
         "Failed load Product"
       );
     }
    
  }





  
}