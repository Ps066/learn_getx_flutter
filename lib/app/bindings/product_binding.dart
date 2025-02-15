import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/controllers/product_controller.dart';

class ProductBinding extends Bindings{  // inherting binding class 

  @override      // overriding the dependencies function 
  void dependencies(){   // it is a built in funtion in bindig classs
    Get.put(()=>ProductController());
  }

}

//* IMPORTANT
// this binding class needs to be attached in the routes to utilize it properly in the project