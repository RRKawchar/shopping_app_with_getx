import 'package:get/get.dart';
import 'package:shoppingn_app_with_getx/getx_practice/models/product.dart';

class ShopeController extends GetxController{
  var product=<Product>[].obs;




  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct()async{

   await Future.delayed(const Duration(seconds: 1));

   var productResult=[
     Product(
         id: 1,
         productName:"FirstProd" ,
         productImage:"abd" ,
         productDescription: 'some description about product',
         price: 30
     ),
     Product(
         id: 2,
         productName: "SecProd",
         productImage: 'abd',
         productDescription:'some description about product',
         price: 40
     ),
     Product(
         id: 3,
         price: 49.5,
         productDescription: 'some description about product',
         productImage: 'abd',
         productName: 'ThirdProd'),


   ];

   product.value=productResult;
  }
}