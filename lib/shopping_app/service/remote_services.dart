import 'package:http/http.dart'as http;
import 'package:shoppingn_app_with_getx/shopping_app/models/product.dart';
class RemoteService{

  static var client=http.Client;

  static Future<List<ProductModel>?> fetchData()async{


   var response=await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));

   if(response.statusCode==200){

     var jsonString =response.body;
    return productFromJson(jsonString);

   }else{

     return null;
   }
  }
}