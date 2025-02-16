import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/controllers/product_controller.dart';

class ProductView extends StatelessWidget {

  //* IMPORTANT
  // before we process we are creating an instance of our controller class 
  // get.put() method is used to build the instance of the class
 final ProductController productController = Get.find<ProductController>();
  // Get.put() creates an object (an instance) of the class and stores it for global access throughout your app.

  //* IMPORTANT
  // Get.find() is used to retrieve the instance of the class that was previously created and stored with Get.put().
  // It allows you to access the already existing object globally, without creating a new one.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Obx((){
        if(productController.isLoading.value){
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }
        if(productController.errMessage.isNotEmpty){
          return  Center(
            child:  Text(productController.errMessage.value)
          );
        }
        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index){
            final product = productController.productList[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price.toString()}'),  // here \$ is written to avoide errors on the use of $
              onTap:(){
                Get.toNamed('/product-details', arguments: product);
              } 
            );
          },
        );
      }),
    );
  }
}


//* IMPORTANT
// Wrapping the body in an Obx widget to make the UI reactive
// body: Obx((){  // The Obx widget listens for changes in reactive data (products list) and rebuilds the widget when updated
//   return ListView.builder(  // Using ListView.builder to create a scrollable list of items. Efficient for dynamic or large lists.
    
     // itemCount is the total number of items in the list, derived from the length of the products list in the controller.
//     itemCount: productController.products.length,  

    // itemBuilder builds each ListTile dynamically as needed when the user scrolls through the list.
//     itemBuilder: (context, index){  // context is not used here, index gives the position of the current item in the list

       // Fetch the current product based on the index of the list.
//       final product = productController.products[index];  

      // Return a ListTile widget to display each product.
//       return ListTile(  
        
        // Display the product's name in the title section of the tile.
//         title: Text(product.name),  

         // Display the product's price in the subtitle section, formatted with a dollar sign and converted to string.
//         subtitle: Text('\$${product.price.toString()}'),  // \$ adds a dollar symbol, and .toString() converts the price to a string

        // When tapped, navigate to the product details page and pass the product as an argument.
//         onTap: Get.toNamed('/product-details', arguments: product),  
//       );
//     },
//   );
// }),



//? Info 
//Why two $ symbols?:
// The first $ is used for string interpolation in Dart. It’s a way to insert variables inside strings.
// The second $ is part of the string to display the dollar sign ($).