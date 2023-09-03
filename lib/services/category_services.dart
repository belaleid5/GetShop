import 'package:assro/utils/Functions/string.dart';
import 'package:http/http.dart'as http;

import '../model/Category_Model.dart';
import '../model/product_model.dart';

class CategoryServices
{

  static Future <List<String>> getAllCategories()
  async {
    var response = await http.get(Uri.parse("$basUrl/products/categories"));
    if(response.statusCode == 200)
    {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }else{
      return throw Exception(
          "Failed load categories"
      );
    }

  }
}


class CategoryAllServices
{

  static Future <List<Product>> getAllProductItems(String nameCategory)
  async {
    var response = await http.get(Uri.parse("$basUrl/products/category/$nameCategory"));
    if(response.statusCode == 200)
    {
      var jsonData = response.body;
      print(jsonData);
      return productFromJson(jsonData);
    }else{
      return throw Exception(
          "Failed Load Product"
      );
    }
  }
}