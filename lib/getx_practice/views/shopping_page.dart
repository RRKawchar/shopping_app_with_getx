import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingn_app_with_getx/getx_practice/controller/cart_controller.dart';
import 'package:shoppingn_app_with_getx/getx_practice/controller/shope_controller.dart';

class ShoppingPage extends StatelessWidget {


  final shopeController=Get.put(ShopeController());
  
  final cartController=Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
             children: [
               Expanded(
                 child: GetX<ShopeController>(
                   builder: (controller) {
                     return ListView.builder(
                       itemCount: controller.product.length,
                         itemBuilder: (context,index){
                           return Card(

                             margin:const EdgeInsets.all(12.0),
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(controller.product[index].productName,
                                               style: const TextStyle(fontSize: 24),
                                               ),
                                               Text(controller.product[index].productDescription),
                                             ],
                                           ),

                                            Text("\& ${controller.product[index].price}"),
                                         ],
                                       ),
                                   ElevatedButton(
                                     onPressed: (){

                                       cartController.addToCart(controller.product[index]);
                                     },
                                     child: const Text("Add To Cart"),
                                   ),
                                   Obx(() => IconButton(
                                       onPressed: (){

                                         controller.product[index].isFavourite.toggle();
                                       },
                                       icon:controller.product[index].isFavourite.value?
                                       Icon(Icons.favorite,color: Colors.red,)
                                       :Icon(Icons.check_box_outline_blank)
                                   )
                                   ),

                                 ],
                               ),
                             ),
                           );
                         }
                     );
                   }
                 ),
               ),

                // GetBuilder<CartController>(
                //     builder: (controller){
                //       return Text("Total amount : \$ ${controller.testamount}",
                //       style:const TextStyle(fontSize: 24,color: Colors.white),
                //       );
                //     }
                // ),
                // GetX<CartController>(
                //   builder: (controller) {
                //     return Text("Total Amount: \$ ${controller.totalPrice}",
                //     style: const TextStyle(
                //       fontSize: 32,color: Colors.white
                //     ),
                //     );
                //   }
                // ),

               Obx(() => IconButton(
                   onPressed: (){

                     cartController.isFavourite.toggle();
                   },
                   icon:cartController.isFavourite.value?
                   Icon(Icons.favorite,color: Colors.red,)
                       :Icon(Icons.check_box_outline_blank)
               )
               ),

               Obx(()=>
                Text("Total Amount: \$ ${cartController.totalPrice}",
                style:const TextStyle(
                  fontSize: 32,color: Colors.white
                ),
                )
               ),
               const SizedBox(height: 100)
             ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amber,
            icon: const Icon(Icons.add_shopping_cart_outlined,color: Colors.black,),
            onPressed: (){

            },
            label: GetX<CartController>(
              builder: (controller) {
                return Text("${controller.count}",style:const TextStyle(
                  fontSize: 24,color: Colors.black
                ),);
              }
            )
        ),
      ),

    );
  }
}
