import 'package:get/get.dart';
import 'package:learn_getx/app/modules/products/models/product_model.dart';
import 'package:learn_getx/app/services/product_service.dart';

class ProductController extends GetxController{
  ProductController({required this.productService}); // constructor 

  final ProductService productService;

  // please note that adding .obs at the end of any variable leads to the formation of a reactive observabal variable.
  var productList = <ProductModel>[].obs;

  // error and loading obs
  var errMessage = ''.obs;
  var isLoading = false.obs;

  // TODO: create an overriding function for the oninit
  @override     //* we are overriding because this is a built in method in getxController class
  void onInit(){ //* explained in lines after 33
    super.onInit();   //! super.onInit() loads the default config of the parent class see below in comments line 57
    fetchProducts();
  }
  //* addAll() is a built-in method of the Dart List class.


  void fetchProducts() async{
    try {
      isLoading(true);
      errMessage('');
      var products = await productService.fetchProducts();
      productList.assignAll(products);
    } catch (e) {
      errMessage('failed to fetch Products');
    }finally{
      isLoading(false);
    }
  }







  //* getxController comes with an default onInit function which is the first function 
  //* that runs when the app is called 
  //* Lifecycle Order in GetXController
  //* GetX provides multiple lifecycle methods:

  //* Method	When it Runs
  //* 1. onInit()	When the controller is first created. Best for initialization & API calls.
  //* 2. onReady()	Called after the widget is built. Good for UI-related calls.
  //* 3. onClose()	Called when the controller is removed from memory. Used for cleanups.


  //* When Should You Use onInit()?
  //* Use onInit() when you need to: 
  //* ✅ Fetch data from an API when the controller is created.
  //* ✅ Initialize variables or listeners.
  //* ✅ Load cached data when the app starts

  //* Does onInit(), onReady(), and onClose() Run One After the Other?
  //* Not exactly. These methods are called at different moments depending on the state of the controller.

  //* 1. Lifecycle Order in GetXController
  //* Here’s how it works in sequence:

  //* 1️⃣ onInit() → Called when the controller is created.
  //* 2️⃣ onReady() → Called when the UI (widget) is completely built.
  //* 3️⃣ onClose() → Called when the controller is removed from memory.

  //* Yes, onInit() is always called first, then onReady() after the UI builds, and onClose() when the controller is destroyed.

  //* why it is important to use super.onInit()?
  //* In GetxController, the parent class (GetxController itself) has some built-in setup when it's created.
  //* When you override onInit(), you are adding your own setup (like fetching API data).
  //* If you don’t call super.onInit(), the parent class won’t do its setup, and some important background work might not happen.

  //* it is not mandatory to do your business logic before super.onInit().
  //* Both orders work, but calling super.onInit(); first is generally safer because it ensures the parent class setup is done before executing your logic.


}