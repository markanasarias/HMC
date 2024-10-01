import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/doctor.dart';
import 'package:health_system/data/api/patient.dart';
import 'package:health_system/data/model/doctor_model.dart';
import 'package:health_system/data/model/patient_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:intl/intl.dart';

class DoctorControllers extends GetxController {
  var selectedFileName = ''.obs;

  Helper helper = Helper();
  var doctor = <DoctorModel>[].obs;
  var filteredDoctor = <DoctorModel>[].obs;
    var searchQuery = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await getloaddoctor();
       filteredDoctor.value = doctor;

  }

    Future<void> getloaddoctor() async {
    print('loaddoctor');
    
    try {
      final response = await Doctor().getdoctor();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          DoctorModel loaddoctor = DoctorModel(
            attendanceInfo['doctor_id'].toString(),
            attendanceInfo['fullname'].toString(),
            attendanceInfo['specialization'].toString(),
            attendanceInfo['phone_number'].toString(),
            attendanceInfo['email'].toString(),
            attendanceInfo['address'].toString(),
            attendanceInfo['years_of_experience'].toString(),
            attendanceInfo['medical_license_number'].toString(),
            attendanceInfo['image'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
          );
          doctor.add(loaddoctor);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

    void filterDoctors() {
    if (searchQuery.value.isEmpty) {
      filteredDoctor.value = doctor; 
    } else {
      filteredDoctor.value = doctor.where((patient) {
        return patient.fullname.toLowerCase().contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }



  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  // Method to clear the selected file
  void removeSelectedFile() {
    selectedFileName.value = '';
  }

}
