import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => cartController.removeFromCart(item),
                    ),
                  );
                },
              );
            }),
          ),
          Obx((){
            return Padding(padding: const EdgeInsets.all(16.0),
            child: Text(
              'Cart Total: \$${cartController.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24
              ),
            ),);
          }),
          ElevatedButton(onPressed: (){
            Get.toNamed('/checkout');
          }, child: const Text("Checkout"))
        ],
      ),
    );
  }
}
