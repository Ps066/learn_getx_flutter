import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/controllers/cart_controller.dart';
import 'package:learn_getx/app/modules/products/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
     // this is the arguments returned from pervious page
    final ProductModel product = Get.arguments; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/cart');
          }, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text('\$${product.price.toString()}', style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              cartController.addToCart(product);
              Get.snackbar('Added to Cart', '${product.name} added to cart');
            }, child: const Text("Add to Cart"))
          ],
        ),
      ),
    );
  }
}