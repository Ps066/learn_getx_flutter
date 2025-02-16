import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/controllers/cart_controller.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thank you for your purchase!!",
              style: TextStyle(fontSize: 24
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
               
              // an instance of cartController 
              final CartController cartController = Get.find<CartController>();

              // clear the cart on checkout
              cartController.cartService.clearCart();

              // Snackbar to show order completion
              Get.snackbar(
                'Order Completed',
                'Your Order has been Successfully Placed',
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.green,
                colorText: Colors.white
              );

              Get.offAllNamed('/product');
            }, child: const Text('Place Order'))
          ],
        ),
      ),
    );
  }
}
