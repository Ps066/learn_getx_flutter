import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/models/product_model.dart';

class CartController extends GetxController{

  // we will create an observable list that will store cart items
  var cartItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;  // double type of variable that is observable in nature


  // a simple function in flutter to add products to the cart list
  void addToCart(ProductModel product){
    cartItems.add(product);
    calculateTotal();
  }


  // a simple function in flutter to remove the product from the cart list
  void removeFromCart(ProductModel product){
    cartItems.remove(product);
    calculateTotal();
  }


  // a function to calculate the ttal price of all the items in the cart 
  void calculateTotal(){
    totalAmount.value = cartItems.fold(0, (sum, item) => sum + item.price);
  }



}



//? IMPORTANT
// The fold() function in Dart is a powerful method used to reduce a list into a single value by applying a function to each element in sequence.
// Understanding fold() in Depth
// Syntax:
//* T fold<T>(T initialValue, T Function(T previousValue, E element) combine)
// initialValue: This is the starting value (or accumulator) for the operation.
// combine: A function that processes each element in the list and accumulates a result.
// The previousValue is the accumulated result (starting from initialValue), and element is the current item in the list.