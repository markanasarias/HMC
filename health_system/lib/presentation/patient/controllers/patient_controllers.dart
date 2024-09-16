import 'dart:convert';
import 'package:get/get.dart';

class PatientControllers extends GetxController {
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
  var isChecked4 = false.obs;
  var isChecked5 = false.obs;
  var selectedOption = 1.obs;
  var birthdayC = ''.obs;
  var selectedGender = 'Male'.obs;
  var selectedcivilstatus = 'Single'.obs;
  var selectedbloodtype = 'O+'.obs;

   final genders = ['Male', 'Female'];
   final civilstatus = ['Single', 'Married'];
     final bloodtype = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  void onInit() async {
    super.onInit();

  }


}
