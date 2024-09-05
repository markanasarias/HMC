// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginControllers extends GetxController {
  var isLoading = false.obs;
  var isPasswordObscured = true.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void login() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offNamed('/index');
    });
  }

  void showDialog(String title, String content) {
    Get.defaultDialog(
      title: title,
      middleText: content,
      textConfirm: 'OK',
      onConfirm: () {
        Get.back();
      },
    );
  }
}
