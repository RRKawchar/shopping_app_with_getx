import 'package:get/get.dart';
import 'package:shoppingn_app_with_getx/getx_practice/models/product.dart';

class CartController extends GetxController{

  var cartItems=<Product>[].obs;


  int get count=>cartItems.length;

  var testamount=0.0;

  final isFavourite=false.obs;

  // double get totalPrice=>cartItems.fold(0, (sum, item) => sum+item.price);

  double get totalPrice=>cartItems.fold(0, (previousValue, element) => previousValue+element.price);

  void addToCart(Product product){
    cartItems.add(product);
    testamount=totalPrice;
    update();
  }
}