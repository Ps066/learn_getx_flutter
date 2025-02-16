import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_getx/app/modules/products/models/product_model.dart';

class CartService extends GetxService{
  final storage = GetStorage();   // this is an instance of get storage 
  var cartItems = <ProductModel>[].obs;  // an empty list of type our Productmodal this is observable


  @override
  void onInit(){
    super.onInit();
    List? storedCart = storage.read<List>('cartItems');
    if(storedCart != null){
      cartItems.assignAll(storedCart.map((e)=> ProductModel.fromJson(e)).toList());
    }
    ever(cartItems,(_){   // it expects 2 things a obs variable and a cb function to avoid giving cb function we used _
      storage.write('cartItems', cartItems.map((e)=> e.toJson()).toList());
    });
  }


  // a simple function in flutter to add products to the cart list
  void addToCart(ProductModel product){
    cartItems.add(product);
  }


  // a simple function in flutter to remove the product from the cart list
  void removeFromCart(ProductModel product){
    cartItems.remove(product);
  }


  // clear cart method
  void clearCart(){
    cartItems.clear();
  }

  // a function to calculate the ttal price of all the items in the cart 
  double get totalAmount{
    return cartItems.fold(0, (sum, item)=> sum + item.price);
  }






}



//? List? storedCart = storage.read<List>('cartItems');
// storage.read<List>('cartItems') attempts to read saved cart items from local storage.
// List? (nullable type) means that storedCart can either:
// Contain a list of cart items (if they exist in storage).
// Be null (if no cart data is found in storage).

//? if (storedCart != null) { ... }
// This checks if storedCart is not null before using it.
// If it is null, the code inside the if block is skipped, preventing errors.

//? cartItems.assignAll(...)
// cartItems is likely an observable list in GetX, which holds the shopping cart items.
// .assignAll(...) replaces all current items in cartItems with new ones.

//? storedCart.map((e) => ProductModel.fromJson(e)).toList()
// Converts stored JSON objects into ProductModel objects.

//? .map((e) => ProductModel.fromJson(e))
// Takes each item (e) from storedCart (which is stored in JSON format).
// Converts it into a ProductModel object using fromJson().

//? .toList()
// Converts the mapped result back into a List so it can be assigned to cartItems.

//? 1️⃣ ever(cartItems, (_) { ... })
// ever() is a GetX reactive function.
// It watches the observable variable (cartItems) and triggers the callback function every time cartItems changes.
// _ is a placeholder parameter, meaning we don’t use it in the function body.

//? 2️⃣ cartItems.map((e) => e.toJson()).toList()
// Converts the cartItems list into JSON format before saving.
// map((e) => e.toJson()) takes each item (e) in cartItems (which is a ProductModel object).
// Calls toJson() to convert it into a map/dictionary ({'name': 'Laptop', 'price': 59999}).
// .toList() ensures the final result is a list of JSON objects.

//? 3️⃣ storage.write('cartItems', ...)
// Saves the converted JSON list to local storage under the key 'cartItems'.
// This ensures that the latest cart data is always saved whenever a change happens.



//* Why Use a Placeholder Parameter (_)?
// ✅ Reason 1: Avoid Unused Variable Warnings
// Dart throws warnings if a parameter is declared but never used.
// Using _ tells Dart that we intentionally don’t need the value.

// 🔴 Without _ (warning occurs)

// void myFunction(int value) {
//   print("Function executed!");
// }

// void main() {
//   myFunction(42); // Warning: The parameter 'value' is never used
// }

// 🟢 With _ (no warning, cleaner code)

// void myFunction(int _) { 
//   print("Function executed!"); 
// }

// void main() {
//   myFunction(42); // No warning
// }
// Here, _ acts as a throwaway variable.

// ✅ Reason 2: Required by Function Signature
// Some functions require a callback with a parameter (even if you don’t use it).

// Example: ever() in GetX

// ever(cartItems, (_) {
//   print("Cart items changed!");
// });
// ever() expects two parameters:
// An observable variable (cartItems).
// A callback function that receives the new value.
// But since we don’t need the new value inside the function, we use _ instead.
// Without _, we'd have to write:

// ever(cartItems, (newCart) {
//   print("Cart items changed!"); 
// });
// Even though newCart isn’t used, it still exists. Using _ is cleaner.