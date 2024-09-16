import 'dart:convert';
import 'package:get/get.dart';

class StaffController extends GetxController {
  var selectedFileName = ''.obs;
  var hiredate = ''.obs;
  var selectedrole = 'Staff'.obs;
   var selectedGender = 'Male'.obs;

  final role = ['Staff', 'Admin'];
     final genders = ['Male', 'Female'];
  @override
  void onInit() async {
    super.onInit();

  }


  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  // Method to clear the selected file
  void removeSelectedFile() {
    selectedFileName.value = '';
  }

}
