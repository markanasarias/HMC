import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/patient.dart';
import 'package:health_system/data/model/patient_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/widget/error.dart';
import 'package:health_system/widget/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';
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
import 'package:open_filex/open_filex.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class PatientControllers extends GetxController {
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
  var isChecked4 = false.obs;
  var isChecked5 = false.obs;
  var selectedOption = 1.obs;
  var birthdayC = ''.obs;
  var age = ''.obs;
  var patient_id = ''.obs;
  var createby = 'Mark'.obs;
  var selectedGender = 'Male'.obs;
  var selectedcivilstatus = 'Single'.obs;
  var selectedbloodtype = 'O+'.obs;
  var fullname = ''.obs;
  var selectedTab = 0.obs;
  var selectedFileNames = ''.obs;
  RxString fileAttachment = ''.obs;
  Rx<String?> selectedFileName = Rx<String?>(null);
  Rx<File?> selectedFile = Rx<File?>(null);
  final TextEditingController medical_record = TextEditingController();
  final TextEditingController first_nameC = TextEditingController();
  final TextEditingController last_nameC = TextEditingController();
  final TextEditingController middle_nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();
  final TextEditingController date_of_birthC = TextEditingController();
  final TextEditingController birth_placeC = TextEditingController();
  final TextEditingController nationalityC = TextEditingController();
  final TextEditingController religionC = TextEditingController();
  final TextEditingController occupationC = TextEditingController();
  final TextEditingController phone_numberC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController emergency_contact_nameC = TextEditingController();
  final TextEditingController emergency_contact_phoneC =
      TextEditingController();
  final TextEditingController philhealth_numberC = TextEditingController();
  final TextEditingController allergiesC = TextEditingController();

  final genders = ['Male', 'Female'];
  final civilstatus = ['Single', 'Married'];
  final bloodtype = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  Helper helper = Helper();
  var patient = <PatientModel>[].obs;
  var medicalrecord = <MedicalRecordModel>[].obs;
  var filteredPatients = <PatientModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
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

  void updateTab(int index) {
    selectedTab.value = index;
  }

  Future<void> addpatient(BuildContext context) async {
    try {
      final response = await Patient().addpatient(
        first_nameC.text,
        last_nameC.text,
        middle_nameC.text,
        age.value,
        birthdayC.value,
        birth_placeC.text,
        selectedGender.value,
        selectedcivilstatus.value,
        nationalityC.text,
        religionC.text,
        occupationC.text,
        phone_numberC.text,
        emailC.text,
        addressC.text,
        emergency_contact_nameC.text,
        emergency_contact_phoneC.text,
        selectedbloodtype.value,
        philhealth_numberC.text,
        allergiesC.text,
        fullname.value,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!',
            text: 'Your request has been successfully submitted.');
        getloadpatient();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Center Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

    Future<void> addmedicalrecord(BuildContext context) async {
    try {
      final response = await Patient().addmedicalrecord(
        patient_id.value,
        medical_record.text,
        fileAttachment.value,
        selectedFileName.value!,
        createby.value,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!',
            text: 'Your request has been successfully submitted.');
        getloadpatient();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Center Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }


  int calculateAge(DateTime birthDate) {
    final currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
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

Future<void> getloadmedicalrecord() async {
  print('Loading medical records for patient ID: ${patient_id.value}');
medicalrecord.clear();
  try {
    final response = await Patient().getmedicalrecord(patient_id.value);
    
    print('Response result: ${response.result}'); 
    if (helper.getStatusString(APIStatus.success) == response.message) {
      for (var attendanceInfo in response.result) {
        // Parse and format the created_date
        DateTime createdDate = DateTime.parse(attendanceInfo['created_date']);
        String formattedDate = DateFormat('yyyy-MM-dd').format(createdDate);

        MedicalRecordModel loadpatient = MedicalRecordModel(
          attendanceInfo['id'].toString(),
          attendanceInfo['patient_id'].toString(),
          attendanceInfo['medical_record'].toString(),
          attendanceInfo['file'].toString(),
          attendanceInfo['status'].toString(),
          attendanceInfo['created_by'].toString(),
          formattedDate, // Use the formatted date
          attendanceInfo['file_name'].toString(),
          attendanceInfo['full_name'].toString(),
        );
        medicalrecord.add(loadpatient);
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}

Future<void> openMedicalRecordFile(String base64File, String fileName) async {
  try {
    // Get the temporary directory of the device
    final tempDir = await getTemporaryDirectory();

    // Create a temporary file with the file name
    final file = File('${tempDir.path}/$fileName');

    // Decode the base64 string and write the content to the file
    await file.writeAsBytes(base64Decode(base64File));

    // Wait for a short time to ensure the file is ready
    await Future.delayed(Duration(milliseconds: 500));

    // Open the file using open_filex
    await OpenFilex.open(file.path);
  } catch (e) {
    print('Error opening file: $e');
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

void openFileExplorer() async {
  print('open');
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    selectedFile.value = File(result.files.single.path!);
    selectedFileName.value = result.files.single.name;

    if (selectedFile.value != null) {
      List<int> fileBytes = await selectedFile.value!.readAsBytes();
      
      // Print the size of the file in bytes
      int fileSizeInBytes = fileBytes.length;
      print('File size in bytes: $fileSizeInBytes');

      // Check if the file size exceeds the limit
      if (fileSizeInBytes > 65535) {
        print('File exceeds the limit of 65,535 bytes.');
        return; // Optionally return or handle the limit exceeded case
      }

      String base64File = base64Encode(fileBytes);
      fileAttachment.value = base64File;

      // Print the Base64 file
      

      // Convert Base64 string back to bytes
      List<int> decodedBytes = base64Decode(fileAttachment.value);
      // print('Decoded bytes: $decodedBytes');
    }
  } else {
    print('No file selected.');
  }
}


  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  void removeSelectedFile() {
    selectedFile.value = null;
    selectedFileName.value = null;
  }
}
