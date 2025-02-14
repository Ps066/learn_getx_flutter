import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/home.dart';

class Aboutpage extends StatefulWidget {
  final String name;
  const Aboutpage({super.key, required this.name});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
            ElevatedButton(
                onPressed: () {
                  Get.to(const HomePage());
                },
                child: const Text("To Home page")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Get.changeThemeMode(ThemeMode.light);
                    },
                    child: const Text("light")),
                TextButton(
                    onPressed: () {
                      Get.changeThemeMode(ThemeMode.dark);
                    },
                    child: const Text("dark")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
