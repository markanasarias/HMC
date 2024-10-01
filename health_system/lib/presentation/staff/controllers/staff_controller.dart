import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/staff.dart';
import 'package:health_system/data/model/staff_model.dart';
import 'package:health_system/repository/helper.dart';


class StaffController extends GetxController {
  var selectedFileName = ''.obs;
  var hiredate = ''.obs;
  var selectedrole = 'Staff'.obs;
   var selectedGender = 'Male'.obs;

     Helper helper = Helper();
var staff = <StaffModel>[].obs;
     var filteredStaff = <StaffModel>[].obs;
    var searchQuery = ''.obs;

  final role = ['Staff', 'Admin'];
     final genders = ['Male', 'Female'];
  @override
  void onInit() async {
    super.onInit();
      await getloadstaff();
 filteredStaff.value = staff;
  }

      Future<void> getloadstaff() async {
    print('loaddoctor');
    
    try {
      final response = await Staff().getstaff();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          StaffModel loadstaff = StaffModel(
            attendanceInfo['staff_id'].toString(),
            attendanceInfo['fullname'].toString(),
            attendanceInfo['role'].toString(),
            attendanceInfo['position'].toString(),
            attendanceInfo['phone_number'].toString(),
            attendanceInfo['email'].toString(),
            attendanceInfo['address'].toString(),
            attendanceInfo['hire_date'].toString(),
            attendanceInfo['image'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
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
      void filterStaff() {
    if (searchQuery.value.isEmpty) {
      filteredStaff.value = staff; 
    } else {
      filteredStaff.value = staff.where((patient) {
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
