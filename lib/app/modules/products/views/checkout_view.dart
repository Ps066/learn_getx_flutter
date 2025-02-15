import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Get.offAllNamed('/product');
            }, child: const Text('Go to Home'))
          ],
        ),
      ),
    );
  }
}
