// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class LoginControllers extends GetxController {
  var isLoading = false.obs;
  var isPasswordObscured = true.obs;
  //Helper helper = Helper();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void logins() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offNamed('/index');
    });
  }

  Future<void> login() async {
    print('login');
    isLoading.value = true;
    // try {
    //   final response =
    //       await Login().login(usernameController.text, passwordController.text);
    //   if (helper.getStatusString(APIStatus.success) == response.message) {
    //     final jsonData = json.encode(response.result);
    //     for (var userinfo in json.decode(jsonData)) {
    //       helper.writeJsonToFile(userinfo, 'metadata.json');
    //     }
    //     Get.offNamed('/index');
    //     isLoading.value = false;
    //   } else {
    //    // Alert(title: 'Oops!', text: 'Username or Password is Incorrect');
    //     isLoading.value = false;
    //   }
    // } catch (error) {
    //   print(error);
    //   isLoading.value = false;
    // }
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
