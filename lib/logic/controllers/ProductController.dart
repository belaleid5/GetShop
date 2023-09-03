import 'package:assro/services/prodct_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_model.dart';

class ProductController extends GetxController
{
    var productList = <Product>[].obs ;
    var productPrice = <Product>[];
    var favoriteList = <Product>[].obs ;
    var searchList = <Product>[].obs ;
    var isLoading = true.obs;
    var getStorage = GetStorage();
    late TextEditingController searchController ;







  void getProducts ()
  async{

  var products = await  ProductServices.getAllProduct();
        try{
          if(products.isNotEmpty)
          {
              isLoading(true);
              productList.addAll(products);
          }
        }finally{
          isLoading(false);
        }

  }


  void mangeIsFavorite(int productId )
  async{
   var existingIndex =  favoriteList.indexWhere((element)=>element.id == productId);
   if(existingIndex >= 0)
   {
     favoriteList.removeAt(existingIndex);
     await getStorage.remove("isFavorite");
   } else{
           favoriteList.add(productList.firstWhere((element) => element.id == productId));
          await  getStorage.write("isFavorite", favoriteList) ;
   }
  }

  bool isFavorite(int productId)
  {
    return favoriteList.any((element) => element.id == productId);
    
  }
  @override
  void onInit() {
    getProducts ();
    super.onInit();
 List? storageList = getStorage.read<List>("isFavorite");
      if(storageList != null)
      {
          favoriteList = storageList.map((e) => Product.fromJson(e)).toList().obs;
      }

    searchController = TextEditingController();
  }



 void searchFormProduct(String searchName)
 {    searchName = searchName.toLowerCase();
     searchList.value = productList.where((search)
     {
             var searchTitle = search.title.toLowerCase();
             var searchPrice = search.title.toLowerCase();
       return   searchTitle.contains(searchName) ||
                searchPrice.toString().contains(searchName);
     } ).toList();
   update();
 }

 void clearSearchList()
 {
   searchController.clear();
   searchFormProduct('');
 }

}