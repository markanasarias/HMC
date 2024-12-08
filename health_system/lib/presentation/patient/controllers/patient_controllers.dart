import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/patient.dart';
import 'package:health_system/data/model/patient_model.dart';
import 'package:health_system/presentation/logs/controller/logs_controller.dart';
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
import 'dart:convert'; // For base64 encoding/decoding
import 'dart:io'; // For file operations
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/api/request_staff.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
import 'package:health_system/data/model/request_staff_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
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
import 'package:health_system/data/model/stocks.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/api/stocks.dart';

class PatientControllers extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);
  Rx<String?> selectedFileName = Rx<String?>(null);
  RxString fileAttachment = RxString('');
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
  var isChecked4 = false.obs;
  var isChecked5 = false.obs;
  var selectedOption = 1.obs;
  var birthdayC = ''.obs;
  var age = ''.obs;
  var patient_id = ''.obs;
  var staffid = ''.obs;
  var branch_id = ''.obs;
  var itemId = ''.obs;
  var itemQuantity = ''.obs;
  var createby = 'Mark'.obs;
  var selectedGender = 'Male'.obs;
  var selectedcivilstatus = 'Single'.obs;
  var selectedbloodtype = 'O+'.obs;
  var fullname = ''.obs;
  var selectedTab = 0.obs;
  var selectedFileNames = ''.obs;
  // RxString fileAttachment = ''.obs;
  // Rx<String?> selectedFileName = Rx<String?>(null);
  // Rx<File?> selectedFile = Rx<File?>(null);
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
  final TextEditingController StatusC = TextEditingController();

  final genders = ['Male', 'Female'];
  final civilstatus = ['Single', 'Married'];
  final bloodtype = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  Helper helper = Helper();
  var patient = <PatientModel>[].obs;
  var medicalrecord = <MedicalRecordModel>[].obs;
  var filteredPatients = <PatientModel>[].obs;
  var searchQuery = ''.obs;
  var addedItems = <InventoryItem>[].obs;
  var stocks = <StocksModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    staffid.value = await helper.getstaffid();
    branch_id.value = await helper.getbranchid();
    await getloadstocks();
    await getloadpatient();
    filteredPatients.value = patient;
  }

  void clearFields() {
  // Clear the TextEditingController value
  medical_record.clear();

  // Reset the Rx<String?> value
  selectedFileName.value = null;

  // Clear the observable list
  addedItems.clear();
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

  String _formatDate1(String? date) {
    if (date == null || date.isEmpty) return '';

    // Specify the input format
    String inputFormat = 'yyyy-MM-dd';
    String outputFormat = 'yyyy-MM-dd';

    try {
      // Parse the date using the specified input format
      DateTime dateTime = DateFormat(inputFormat).parse(date);
      // Return the formatted date as a string
      return DateFormat(outputFormat, 'en_US').format(dateTime);
    } catch (e) {
      return ''; // Return empty string if parsing fails
    }
  }

  void printItemsAsJson() {
    var jsonData = addedItems.map((item) => item.toJson()).toList();
    var result = {"data": jsonData};

    // Print the result in JSON-like format
    print(result);
  }

  void addItem(String itemid, String itemName, String quantity) {
    addedItems.add(
        InventoryItem(itemid: itemid, itemName: itemName, quantity: quantity));
  }

  void updateTab(int index) {
    selectedTab.value = index;
  }

  void reload() async {
    patient.clear();
    await getloadpatient();
  }

  void clear() {
    first_nameC.clear();
    last_nameC.clear();
    middle_nameC.clear();
    age.value = '';
    birthdayC.value = '';
    birth_placeC.clear();
    selectedGender.value = 'Male';
    selectedcivilstatus.value = 'Single';
    nationalityC.clear();
    religionC.clear();
    occupationC.clear();
    phone_numberC.clear();
    emailC.clear();
    addressC.clear();
    emergency_contact_nameC.clear();
    emergency_contact_phoneC.clear();
    selectedbloodtype.value = 'O+';
    philhealth_numberC.clear();
    allergiesC.clear();
  }

  Future<void> addpatient(BuildContext context) async {
    try {
      // Validation for empty fields
      if (first_nameC.text.isEmpty ||
          last_nameC.text.isEmpty ||
          age.value.isEmpty ||
          birthdayC.value == null ||
          birth_placeC.text.isEmpty ||
          selectedGender.value == null ||
          selectedcivilstatus.value == null ||
          nationalityC.text.isEmpty ||
          religionC.text.isEmpty ||
          occupationC.text.isEmpty ||
          phone_numberC.text.isEmpty ||
          addressC.text.isEmpty ||
          emergency_contact_nameC.text.isEmpty ||
          emergency_contact_phoneC.text.isEmpty ||
          selectedbloodtype.value == null ||
          philhealth_numberC.text.isEmpty ||
          allergiesC.text.isEmpty ||
          fullname.value.isEmpty) {
        showErrorToast(context,
            title: 'Error!', text: 'All fields must be filled.');
        return;
      }

      // Proceed with adding the patient
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

      // Handle the response
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!',
            text: 'Your request has been successfully submitted.');
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Added Patient');
        getloadpatient();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Center Already Exists!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

  Future<void> updatepatient(BuildContext context, String patientid) async {
    try {
      final response = await Patient().updatepatient(
        patientid,
        first_nameC.text,
        last_nameC.text,
        middle_nameC.text,
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
        StatusC.text,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!',
            text: 'Your request has been successfully submitted.');
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Update Patient');
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

Future<void> addmedicalrecord(
    BuildContext context, List<Map<String, dynamic>> updatedItems) async {
  try {
    print("Processing Medical Record with Items: $updatedItems");

    updatedItems.forEach((item) {
      itemId.value = item['item_id'].toString();  
      itemQuantity.value = item['quantity'].toString();  

      print("Extracted item_id: ${itemId.value}, item_quantity: ${itemQuantity.value}");
    });

    final response = await Patient().addmedicalrecord(
        patient_id.value,
        medical_record.text,
        selectedFileName.value!,
        createby.value,
        jsonEncode(updatedItems));

    if (response.message == 'success') {
      showSuccessToast(context,
          title: 'Success!',
          text: 'Your request has been successfully submitted.');

      final logsController = Get.put(LogsController());
      await logsController.addlogs(staffid.value, 'Added Patient Medical Record');

      if (selectedFile.value != null) {
        await saveFileToCustomDirectory(
            selectedFile.value!, selectedFileName.value!);
      }
     await updatebranchinv(context, updatedItems);
      getloadmedicalrecord();
      clearFields();
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




Future<void> updatebranchinv(BuildContext context, updatedItems) async {
  try {


    final response = await Patient().updatebranchinv(updatedItems);

    print('Response: ${response.message}');
    if (response.message == 'success') {
      // Handle success
    } else {
      // Handle failure
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
    patient.clear();
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
        filterPatients();
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> selectpatient(String patientid) async {
    print('loadpatient');

    try {
      final response = await Patient().selectpatient(patientid);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          PatientModel loadpatient = PatientModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['firstName'].toString(),
            attendanceInfo['lastName'].toString(),
            attendanceInfo['middleName'].toString(),
            attendanceInfo['age'].toString(),
            _formatDate1(attendanceInfo['dateOfBirth'].toString()),
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
          last_nameC.text = loadpatient.lastName;
          first_nameC.text = loadpatient.firstName;
          middle_nameC.text = loadpatient.middleName;
          birthdayC.value = loadpatient.dateOfBirth;
          birth_placeC.text = loadpatient.birthPlace;
          selectedGender.value = loadpatient.gender;
          nationalityC.text = loadpatient.nationality;
          religionC.text = loadpatient.religion;
          occupationC.text = loadpatient.occupation;
          phone_numberC.text = loadpatient.phoneNumber;
          selectedcivilstatus.value = loadpatient.civilStatus;
          addressC.text = loadpatient.address;
          emailC.text = loadpatient.email;
          emergency_contact_nameC.text = loadpatient.emergencyContactName;
          emergency_contact_phoneC.text = loadpatient.emergencyContactPhone;
          selectedbloodtype.value = loadpatient.bloodType;
          allergiesC.text = loadpatient.allergies;
          philhealth_numberC.text = loadpatient.philhealthNumber;
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

  Future<void> openFile(String base64File, String fileName) async {
    // Decode the base64 file
    final bytes = base64.decode(base64File);

    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a file in the temporary directory
    final file = File('${directory.path}/$fileName');

    // Write the bytes to the file
    await file.writeAsBytes(bytes);

    // Open the file
    await OpenFile.open(file.path);
  }

  void filterPatients() {
    if (searchQuery.value.isEmpty) {
      filteredPatients.value = patient;
    } else {
      // Split the search query into first and last name parts
      List<String> queryParts = searchQuery.value.split(' ');

      filteredPatients.value = patient.where((patient) {
        // If the query contains two parts, check both firstName and lastName
        if (queryParts.length > 1) {
          return patient.firstName
                  .toLowerCase()
                  .contains(queryParts[0].toLowerCase()) &&
              patient.lastName
                  .toLowerCase()
                  .contains(queryParts[1].toLowerCase());
        }
        // If the query has one part, check both firstName and lastName separately
        else {
          return patient.firstName
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              patient.lastName
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase());
        }
      }).toList();
    }
  }

  void openFileExplorer() async {
    print('open');

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
      selectedFileName.value = result.files.single.name;

      if (selectedFile.value != null) {
        List<int> fileBytes = await selectedFile.value!.readAsBytes();

        // Print the size of the file in bytes
        int fileSizeInBytes = fileBytes.length;
        print('File size in bytes: $fileSizeInBytes');

        String base64File = base64Encode(fileBytes);
        fileAttachment.value = base64File;

        // Print the Base64 file
        print('Base64 encoded file: $base64File');

        // Save the file to the custom directory
        await saveFileToCustomDirectory(
            selectedFile.value!, selectedFileName.value!);

        // Refresh the directory cache (if required by the system)
        refreshSavedFile(selectedFile.value!, selectedFileName.value!);
      }
    } else {
      print('No file selected.');
    }
  }

  Future<void> saveFileToCustomDirectory(File file, String fileName) async {
    try {
      // Specify the directory where you want to save the file
      String customDirectoryPath =
          r'C:\HMC\HMC\health_system\assets'; // Change path as needed

      // Check if the directory exists, create it if not
      Directory customDirectory = Directory(customDirectoryPath);
      if (!await customDirectory.exists()) {
        await customDirectory.create(recursive: true);
      }

      // Save the file to the specified directory
      String filePath = '$customDirectoryPath\\$fileName';
      File newFile = await file.copy(filePath);

      print('File saved to: $filePath');
    } catch (e) {
      print('Error saving file: $e');
    }
  }

// Function to manually refresh the file system (optional for your case)
  void refreshSavedFile(File file, String fileName) async {
    try {
      // Manually refresh the file to make sure the system recognizes it.
      // This works by re-opening or checking the file directly in its location
      if (await file.exists()) {
        print('File exists after saving: ${file.path}');

        // Additional action could be to update state or notify the app that the file was saved
        // For instance, updating an observable or refreshing data in the UI without full rebuild
      } else {
        print('File does not exist after saving.');
      }
    } catch (e) {
      print('Error refreshing the saved file: $e');
    }
  }

  Future<void> openMedicalRecord(String base64File, String fileName) async {
    // Decode Base64 string
    final bytes = base64Decode(base64File);

    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$fileName';

    // Write bytes to a file
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    // Open the file
    await OpenFile.open(filePath);
  }

  // Future<void> openMedicalRecordFromBase64(String base64File) async {
  //   try {
  //     // Decode the Base64 string
  //     List<int> bytes = base64Decode(base64File);

  //     // Get the temporary directory to store the PDF
  //     final directory = await getTemporaryDirectory();
  //     final filePath = '${directory.path}/medical_record.pdf';

  //     // Write the bytes to a PDF file
  //     File file = File(filePath);
  //     await file.writeAsBytes(bytes);

  //     // Open the PDF using flutter_cached_pdfview
  //     Get.to(() => CachedPdfView(
  //       filePath: filePath,
  //     ));
  //   } catch (e) {
  //     print("Error opening PDF: $e");
  //   }
  // }

  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  void removeSelectedFile() {
    selectedFile.value = null;
    selectedFileName.value = null;
  }

  Future<void> getloadstocks() async {
    print('getloadcenter');
    stocks.clear();
    try {
      final response = await Stocks().getstocks(branch_id.value);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var itemsinfo in json.decode(jsondata)) {
          // Print raw createddate and expiry_date to debug
          print('Raw createddate: ${itemsinfo['createddate']}');
          print('Raw expiry_date: ${itemsinfo['expiry_date']}');

          // Try parsing createddate and expiry_date
          DateTime createdDate;
          DateTime expiryDate;

          try {
            createdDate = DateTime.parse(itemsinfo['createddate'].toString());
          } catch (e) {
            print('Error parsing createddate: ${itemsinfo['createddate']}');
            createdDate = DateTime.now(); // Default value
          }

          try {
            expiryDate = DateTime.parse(itemsinfo['expiry_date'].toString());
          } catch (e) {
            print('Error parsing expiry_date: ${itemsinfo['expiry_date']}');
            expiryDate = DateTime.now(); // Default value
          }

          // Format dates using DateFormat
          String formattedCreatedDate =
              DateFormat('dd/MM/yyyy').format(createdDate);
          String formattedExpiryDate =
              DateFormat('dd/MM/yyyy').format(expiryDate);

          // Create StocksModel object
          StocksModel stock = StocksModel(
            itemsinfo['item_id'].toString(),
            itemsinfo['item_name'].toString(),
            itemsinfo['category'].toString(),
            itemsinfo['quantity'].toString(),
            formattedCreatedDate,
            itemsinfo['purchase_date'].toString(),
            formattedExpiryDate,
            itemsinfo['createby'].toString(),
            itemsinfo['branch_id'].toString(),
            itemsinfo['status'].toString(),
          );

          stocks.add(stock);
        }
        filterPatients();
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }
}

class InventoryItem {
  final String itemid;
  final String itemName;
  final String quantity;

  InventoryItem(
      {required this.itemid, required this.itemName, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'itemid': itemid,
      'itemName': itemName,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return 'ItemID: $itemid,  Item: $itemName, Quantity: $quantity';
  }
}
