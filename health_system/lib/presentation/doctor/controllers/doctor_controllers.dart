import 'dart:convert';
import 'package:get/get.dart';

class DoctorControllers extends GetxController {
  var selectedFileName = ''.obs;

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
