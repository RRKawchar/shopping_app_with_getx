import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingn_app_with_getx/shopping_app/controllers/product_controller.dart';
import 'package:shoppingn_app_with_getx/shopping_app/models/product.dart';

class ProductTile extends StatelessWidget {
   ProductTile({Key? key, required this.productModel,}) : super(key: key);

  final ProductModel productModel;

  final productController=Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [Container(
              padding: const EdgeInsets.all(20),
              child: Image.network(productModel.imageLink.toString()),
            ),
            Positioned(
              right: 2,
              child: Obx(() => CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {
                    productModel.isFavourite.toggle();
                  },
                  icon: productModel
                      .isFavourite.value
                      ? const Icon(Icons.favorite,
                      color: Colors.red, size: 32)
                      : const Icon(Icons.favorite_outline),
                ),
              )),
            ),
            Positioned(
                bottom: 20,
                child: Container(
                  child: Text(
                    productModel.name
                        .toString(),
                    maxLines: 2,
                  ),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    Text(
                     productModel.rating.toString(),
                      style: const TextStyle(
                          color: Colors.white
                      ),
                    ),
                    const Icon(
                      Icons.star,size: 13,color: Colors.yellow,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
