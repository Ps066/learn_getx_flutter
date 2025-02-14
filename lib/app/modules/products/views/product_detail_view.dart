import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
     // this is the arguments returned from pervious page
    final ProductModel product = Get.arguments; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text('\$${product.price.toString()}', style: const TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }
}