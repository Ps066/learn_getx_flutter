import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_getx/app/bindings/product_binding.dart';
import 'package:learn_getx/app/routes/app_pages.dart';
import 'package:learn_getx/app/services/cart_service.dart';

void main() async {
  await GetStorage.init(); // initilizing the getstorage before app load
  Get.put(CartService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),  // Explicitly set light theme
      darkTheme: ThemeData.dark(),  // Explicitly set dark theme
      themeMode: ThemeMode.system,  // Default to system theme (optional)
      getPages: AppPages.routes,
      initialRoute: Routes.PRODUCT,
      initialBinding: ProductBinding(),
    );
  }
}
