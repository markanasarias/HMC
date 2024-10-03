import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/patient.dart';
import 'package:health_system/data/model/patient_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:intl/intl.dart';

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

  Helper helper = Helper();
  var patient = <PatientModel>[].obs;
  var filteredPatients = <PatientModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await getloadpatient();
    filteredPatients.value = patient;
  }

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    List<String> formats = [
      'yyyy-MM-dd',
      'EEEE, MMMM d, y',
      'dd MMM yyyy',
    ];

    for (String format in formats) {
      try {
        DateTime dateTime = DateFormat(format).parse(date);
        return DateFormat('MMMM d, y', 'en_US').format(dateTime);
      } catch (e) {}
    }
    return '';
  }

  Future<void> getloadpatient() async {
    print('loadpatient');

    try {
      final response = await Patient().getpatient();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          PatientModel loadpatient = PatientModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['firstName'].toString(),
            attendanceInfo['lastName'].toString(),
            attendanceInfo['middleName'].toString(),
            attendanceInfo['age'].toString(),
            _formatDate(attendanceInfo['dateOfBirth'].toString()),
            attendanceInfo['birthPlace'].toString(),
            attendanceInfo['gender'].toString(),
            attendanceInfo['civilStatus'].toString(),
            attendanceInfo['nationality'].toString(),
            attendanceInfo['religion'].toString(),
            attendanceInfo['occupation'].toString(),
            attendanceInfo['phoneNumber'].toString(),
            attendanceInfo['email'].toString(),
            attendanceInfo['address'].toString(),
            attendanceInfo['emergencyContactName'].toString(),
            attendanceInfo['emergencyContactPhone'].toString(),
            attendanceInfo['bloodType'].toString(),
            attendanceInfo['philhealthNumber'].toString(),
            attendanceInfo['allergies'].toString(),
            attendanceInfo['createdBy'].toString(),
            attendanceInfo['createdDate'].toString(),
          );
          patient.add(loadpatient);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  void filterPatients() {
    if (searchQuery.value.isEmpty) {
      filteredPatients.value = patient;
    } else {
      filteredPatients.value = patient.where((patient) {
        return patient.firstName
                .toLowerCase()
                .contains(searchQuery.value.toLowerCase()) ||
            patient.lastName
                .toLowerCase()
                .contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }
}
