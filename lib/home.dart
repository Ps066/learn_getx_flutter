import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(const Aboutpage(name: "Prashant shukla"));
            }, child: const Text("To about page")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  Get.changeThemeMode(ThemeMode.light);
                }, child: const Text("light")),
                TextButton(onPressed: (){
                  Get.changeThemeMode(ThemeMode.dark);
                }, child: const Text("dark")),
              ],
            )
          ],
        ),
      ),
    );
  }
}