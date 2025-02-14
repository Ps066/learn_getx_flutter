# learn_getx

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### How to use Get State Management (GetX)

- In ```main.dart``` switch ```MaterialApp()``` to ```GetMaterialApp()``` this has imp features of getx state management that overrides the `MaterialApp`.
- To set theme we can directly use get by the command `Get.changeThemeMode(ThemeMode.light);` to set our theme as light and `Get.changeThemeMode(ThemeMode.dark);` to set our theme dark.
- Just like traditional flutter syntax `Navigator.push()` can be replaced by `Get.to()` and `Navigator.pop()` can be replaced by `Get.back()` for easy navigation in flutter app with get state management.
- We can use `Get.height` and `Get.width` to find the height and width of the screen insted of using *MediaQuery*
- 
