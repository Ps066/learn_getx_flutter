import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/controllers/cart_controller.dart';

class CartBinding extends Bindings{


  @override
  void dependencies(){
    Get.put(CartController());
  }
}


//* IMPORTANT
// this binding class needs to be attached in the routes to utilize it properly in the project