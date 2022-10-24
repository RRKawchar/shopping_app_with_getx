import 'package:get/get.dart';
import 'package:shoppingn_app_with_getx/shopping_app/models/product.dart';
import 'package:shoppingn_app_with_getx/shopping_app/service/remote_services.dart';

class ProductController extends GetxController{
  var isLoading=true.obs;

  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

   void fetchProduct()async{
       try{
         isLoading(true);
         var product= await RemoteService.fetchData();
         if(product!=null){
           productList.value=product;
         }
       }finally{
        isLoading(false);
       }

   }
}