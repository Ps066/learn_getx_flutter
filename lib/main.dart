import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/bindings/product_binding.dart';
import 'package:learn_getx/app/modules/products/views/product_view.dart';
import 'package:learn_getx/app/routes/app_pages.dart';

void main() {
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
      home: Productviews(),
      getPages: AppPages.routes,
      initialBinding: ProductBinding(),
    );
  }
}
