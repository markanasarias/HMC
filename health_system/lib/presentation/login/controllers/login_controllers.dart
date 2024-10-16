// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/data/api/login.dart';
import 'package:health_system/presentation/logs/controller/logs_controller.dart';
import 'package:health_system/repository/helper.dart';
import 'dart:convert';
import 'package:health_system/widget/alert.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:health_system/widget/error.dart';
import 'package:health_system/widget/success.dart';
import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/center/controller/center_controller.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:health_system/presentation/logs/controller/logs_controller.dart';

class LoginControllers extends GetxController {
  var isLoading = false.obs;
  var isPasswordObscured = true.obs;
  var staffid = ''.obs;
  Helper helper = Helper();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    staffid.value = await helper.getstaffid();
  }

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
    try {
      final response =
          await Login().login(usernameController.text, passwordController.text);
      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsonData = json.encode(response.result);
        for (var userinfo in json.decode(jsonData)) {
          helper.writeJsonToFile(userinfo, 'metadata.json');
        }
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Added center');

        Get.offNamed('/index');
        isLoading.value = false;
      } else {
        Alert(title: 'Oops!', text: 'Username or Password is Incorrect');
        isLoading.value = false;
      }
    } catch (error) {
      print(error);
      isLoading.value = false;
    }
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
