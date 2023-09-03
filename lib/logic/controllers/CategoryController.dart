import 'package:assro/model/product_model.dart';
import 'package:get/get.dart';

import '../../services/category_services.dart';

class CategoryController extends GetxController
{
  var categoriesList = <String>[].obs;
  var categoriesItemsName = <Product>[].obs;
  var isCategoriesLoading = false.obs;
  var isCategoriesItemLoading = false.obs;



  List<String> imageListCategory =
  [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  ];


  void getCategories ()   async
  {
    var categoriesName = await CategoryServices.getAllCategories();
    try{
      isCategoriesLoading(true);
      if(categoriesName.isNotEmpty)
      {
        categoriesList.addAll(categoriesName);
      }
    }finally{
      isCategoriesLoading(false);
    }

  }

  getAllCategories(String nameCategory)
  async{
    isCategoriesItemLoading(true);
    categoriesItemsName.value = await CategoryAllServices.getAllProductItems(nameCategory);
    isCategoriesItemLoading(false);
  }

  getCategoryIndex(int index)async
  {

    var categoryAllName = getAllCategories(categoriesList[index]);
    if(categoryAllName !=null)
    {
      categoriesItemsName.value = categoryAllName;
    }

  }



  @override
  void onInit() {
     getCategories();
    super.onInit();
  }
}