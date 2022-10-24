import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingn_app_with_getx/shopping_app/controllers/product_controller.dart';
import 'package:shoppingn_app_with_getx/shopping_app/models/product.dart';
import 'package:shoppingn_app_with_getx/shopping_app/view/product_tile.dart';

class HomePage extends StatelessWidget {

  final productController = Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "ShopX",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {

                if(productController.isLoading.value){
                  return Center(child: CircularProgressIndicator());
                }else{
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: productController.productList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return ProductTile(productModel: productController.productList[index]);
                      });
                }

              }
            ),
          )
        ],
      ),
    );
  }
}
