import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/staff.dart';
import 'package:health_system/data/model/staff_model.dart';
import 'package:health_system/repository/helper.dart';
import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
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



class StaffController extends GetxController {
  var selectedFileNames = ''.obs;
  var staffid = '';
  var hiredate = ''.obs;
  var fullname = ''.obs;
  var selectedrole = 'Staff'.obs;
  var selectedbranch = ''.obs;
  RxString fileAttachment = ''.obs;
  Rx<String?> selectedFileName = Rx<String?>(null);

  final TextEditingController fullnameC = TextEditingController();
  final TextEditingController positionC = TextEditingController();
  final TextEditingController specializationC = TextEditingController();
  final TextEditingController medical_license_numberC = TextEditingController();
  final TextEditingController years_of_experienceC = TextEditingController();
  final TextEditingController phone_numberC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController addressC = TextEditingController();


  Helper helper = Helper();
  var center = <CenterModel>[].obs;
  var staff = <StaffModel>[].obs;
  var filteredStaff = <StaffModel>[].obs;
   Rx<File?> selectedFile = Rx<File?>(null);
  var searchQuery = ''.obs;

  final role = ['Admin', 'Doctor', 'Staff', ];
  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
      await getloadstaff();
 filteredStaff.value = staff;
  }

  Future<void> addstaff(BuildContext context) async {
  try {
    final response = await Staff().addstaff(selectedrole.value, fullnameC.text,
    positionC.text, specializationC.text,
    phone_numberC.text, emailC.text,
    addressC.text, hiredate.value,
    years_of_experienceC.text, medical_license_numberC.text,
    fileAttachment.value,  fullname.value,
    selectedbranch.value,
    );
    if (response.message == 'success') {
      showSuccessToast(context, title: 'Success!', text: 'Patient added successfully.');
      getloadstaff();
       Navigator.of(context).pop();
    } else {
      showErrorToast(context, title: 'Oops!', text: 'Center Already Exist!');
    }
  } catch (e) {
    print('An error occurred: $e');
    showErrorToast(context, title: 'Oops!', text: 'There was an issue. Please try again.');
  }
}

      Future<void> getloadstaff() async {
    print('loaddoctor');
    staff.clear();
    try {
      final response = await Staff().getstaff();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          StaffModel loadstaff = StaffModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['type'].toString(),
            attendanceInfo['fullname'].toString(),
            attendanceInfo['position'].toString(),
            attendanceInfo['specialization'].toString(),
            attendanceInfo['phone_number'].toString(),
            attendanceInfo['email'].toString(),
            attendanceInfo['address'].toString(),
            attendanceInfo['hire_date'].toString(),
            attendanceInfo['years_of_experience'].toString(),
            attendanceInfo['medical_license_number'].toString(),
            attendanceInfo['image'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
            attendanceInfo['status'].toString(),
            attendanceInfo['center'].toString(),
          );
          staff.add(loadstaff);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

Future<void> selectstaff(String staffid) async {
  print('loaddoctor');
  try {
    final response = await Staff().selectstaff(staffid);

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);
      for (var attendanceInfo in json.decode(jsondata)) {
        StaffModel loadstaff = StaffModel(
          attendanceInfo['id'].toString(),
          attendanceInfo['type'].toString(),
          attendanceInfo['fullname'].toString(),
          attendanceInfo['position'].toString(),
          attendanceInfo['specialization'].toString(),
          attendanceInfo['phone_number'].toString(),
          attendanceInfo['email'].toString(),
          attendanceInfo['address'].toString(),
          // Format the hire_date to YYYY-MM-DD
          DateFormat('yyyy-MM-dd').format(DateTime.parse(attendanceInfo['hire_date'])),
          attendanceInfo['years_of_experience'].toString(),
          attendanceInfo['medical_license_number'].toString(),
          attendanceInfo['image'].toString(),
          attendanceInfo['createby'].toString(),
          attendanceInfo['createddate'].toString(),
          attendanceInfo['status'].toString(),
          attendanceInfo['center'].toString(),
        );
        staff.add(loadstaff);
        fullnameC.text = loadstaff.fullname;
        //selectedrole.value = loadstaff.type;
        positionC.text = loadstaff.position;
        hiredate.value = DateFormat('yyyy-MM-dd').format(DateTime.parse(loadstaff.hire_date)); // Ensure it is formatted in the same way here
        specializationC.text = loadstaff.specialization;
        medical_license_numberC.text = loadstaff.medical_license_number;
        years_of_experienceC.text = loadstaff.years_of_experience;
        selectedbranch.value = loadstaff.center;
        phone_numberC.text = loadstaff.phone_number;
        emailC.text = loadstaff.email;
        addressC.text = loadstaff.address;
        fileAttachment.value = loadstaff.image;
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}

      void filterStaff() {
    if (searchQuery.value.isEmpty) {
      filteredStaff.value = staff; 
    } else {
      filteredStaff.value = staff.where((patient) {
        return patient.fullname.toLowerCase().contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }

void openFileExplorer() async {
  print('open');
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    selectedFile.value = File(result.files.single.path!);
    selectedFileName.value = result.files.single.name;

    if (selectedFile.value != null) {
      List<int> fileBytes = await selectedFile.value!.readAsBytes();
      String base64File = base64Encode(fileBytes);
      fileAttachment.value = base64File;

      print('Base64 file: ${fileAttachment.value}');

    }
  } else {
    print('No file selected.');
  }
}

  void clearFields() {
    fullnameC.clear();
    positionC.clear();
    //selectedrole.value = ''; 
    hiredate.value = ''; 
    specializationC.clear();
    medical_license_numberC.clear();
    years_of_experienceC.clear();
    selectedbranch.value = '';
    phone_numberC.clear();
    emailC.clear();
    addressC.clear();
    fileAttachment.value = '';
  }



  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  void removeSelectedFile() {
    selectedFile.value = null;
    selectedFileName.value = null;
  }
}
