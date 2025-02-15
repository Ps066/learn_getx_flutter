import 'package:get/get.dart';
import 'package:learn_getx/app/bindings/cart_binding.dart';
import 'package:learn_getx/app/bindings/product_binding.dart';
import 'package:learn_getx/app/modules/products/views/cart_view.dart';
import 'package:learn_getx/app/modules/products/views/checkout_view.dart';
import 'package:learn_getx/app/modules/products/views/product_detail_view.dart';
import 'package:learn_getx/app/modules/products/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => Productviews(),
      binding: ProductBinding()
    ),
    GetPage(
      name: Routes.PRODUCT_DETAILS,
      page: () => ProductDetailView()
    ),
    GetPage(
      name: Routes.CART,
      page: ()=> CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.CHECKOUT,
      page: ()=> const CheckOutView()
    ),
  ];
}
