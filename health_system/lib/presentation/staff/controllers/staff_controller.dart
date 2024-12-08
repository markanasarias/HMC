import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/staff.dart';
import 'package:health_system/data/model/staff_model.dart';
import 'package:health_system/presentation/logs/controller/logs_controller.dart';
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

  var staffid = ''.obs;
  var hiredate = ''.obs;
  var fullname = ''.obs;
  var selectedrole = 'Admin'.obs;
  var selectedbranch = 'Main Branches Langgam'.obs;
  var timeRange = ''.obs;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  RxString fileAttachment = ''.obs;
  var selectedTab = 0.obs;
  Rx<String?> selectedFileName = Rx<String?>(null);

  final TextEditingController fullnameC = TextEditingController();
  final TextEditingController positionC = TextEditingController();
  final TextEditingController specializationC = TextEditingController();
  final TextEditingController medical_license_numberC = TextEditingController();
  final TextEditingController years_of_experienceC = TextEditingController();
  final TextEditingController phone_numberC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController StatusC = TextEditingController();
  final TextEditingController SchedDaysC = TextEditingController();
  final TextEditingController SchedTimeC = TextEditingController();

  Helper helper = Helper();
  var center = <CenterModel>[].obs;
  var staff = <StaffModel>[].obs;
  var sched = <ScheduleModel>[].obs;
  var filteredStaff = <StaffModel>[].obs;
  Rx<File?> selectedFile = Rx<File?>(null);
  var searchQuery = ''.obs;

  final role = [
    'Admin',
    'Doctor',
    'Staff',
  ];
  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    await getloadstaff();
    filteredStaff.value = staff;
  }

  void updateTab(int index) {
    selectedTab.value = index;
  }

  Future<void> selectTimeRange(BuildContext context) async {
    // Select Start Time
    final TimeOfDay? pickedStart = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );

    if (pickedStart != null) {
      startTime = pickedStart;

      // Select End Time
      final TimeOfDay? pickedEnd = await showTimePicker(
        context: context,
        initialTime: endTime ?? TimeOfDay.now(),
      );

      if (pickedEnd != null) {
        endTime = pickedEnd;

        // Update the timeRange observable
        timeRange.value =
            "${_formatTime(startTime!)} - ${_formatTime(endTime!)}";
      }
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm a').format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );
    return formattedTime;
  }

  Future<void> addstaff(BuildContext context) async {
    if (selectedrole.value == null ||
        fullnameC.text.isEmpty ||
        positionC.text.isEmpty ||
        specializationC.text.isEmpty ||
        phone_numberC.text.isEmpty ||
        emailC.text.isEmpty ||
        addressC.text.isEmpty ||
        hiredate.value == null ||
        fileAttachment.value == null ||
        fullname.value == null ||
        selectedbranch.value == null) {
      showErrorToast(context,
          title: 'Missing Fields!',
          text: 'Please fill in all required fields.');
      return;
    }

    try {
      final response = await Staff().addstaff(
        selectedrole.value,
        fullnameC.text,
        positionC.text,
        specializationC.text,
        phone_numberC.text,
        emailC.text,
        addressC.text,
        hiredate.value,
        years_of_experienceC.text,
        medical_license_numberC.text,
        fileAttachment.value,
        fullname.value,
        selectedbranch.value,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Staff added successfully.');
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Added Staff');
        clearFields();
        getloadstaff();
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

  Future<void> updatestaff(BuildContext context, String id) async {
    try {
      final response = await Staff().updatestaff(
        id,
        selectedrole.value,
        fullnameC.text,
        positionC.text,
        specializationC.text,
        phone_numberC.text,
        emailC.text,
        addressC.text,
        hiredate.value,
        years_of_experienceC.text,
        medical_license_numberC.text,
        fileAttachment.value,
        StatusC.text,
        selectedbranch.value,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Staff update successfully.');
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Update Staff');
        clearFields();
        getloadstaff();
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
    print('Loading staff information...');
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
            DateFormat('yyyy-MM-dd')
                .format(DateTime.parse(attendanceInfo['hire_date'])),
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
          selectedrole.value = loadstaff.type;
          positionC.text = loadstaff.position;
          hiredate.value = DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(loadstaff.hire_date));
          specializationC.text = loadstaff.specialization;
          medical_license_numberC.text = loadstaff.medical_license_number;
          years_of_experienceC.text = loadstaff.years_of_experience;
          selectedbranch.value = loadstaff.center;
          phone_numberC.text = loadstaff.phone_number;
          emailC.text = loadstaff.email;
          addressC.text = loadstaff.address;
          fileAttachment.value = loadstaff.image;
          selectedbranch.value = loadstaff.center;
          StatusC.text = loadstaff.status;
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading staff data: $e');
    }
  }

  void filterStaff() {
    if (searchQuery.value.isEmpty) {
      filteredStaff.value = staff;
    } else {
      filteredStaff.value = staff.where((patient) {
        return patient.fullname
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
        String base64File = base64Encode(fileBytes);
        fileAttachment.value = base64File;

        print('Base64 file: ${fileAttachment.value}');
      }
    } else {
      print('No file selected.');
    }
  }

  // Schedule
  Future<void> getsched(String staffid) async {
    print('loaddoctor');
    sched.clear();
    try {
      final response = await Staff().loadschedule(staffid);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          ScheduleModel loadstaff = ScheduleModel(
            attendanceInfo['schedule_id'].toString(),
            attendanceInfo['staff_id'].toString(),
            attendanceInfo['work_date'].toString(),
            attendanceInfo['shift_time'].toString(),
            attendanceInfo['status'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
            attendanceInfo['fullname'].toString(),
          );
          sched.add(loadstaff);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> selectsched(String scheduleid) async {
    print('loaddoctor');
    try {
      final response = await Staff().selectschedule(scheduleid);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var attendanceInfo in json.decode(jsondata)) {
          ScheduleModel loadstaff = ScheduleModel(
            attendanceInfo['schedule_id'].toString(),
            attendanceInfo['staff_id'].toString(),
            attendanceInfo['work_date'].toString(),
            attendanceInfo['shift_time'].toString(),
            attendanceInfo['status'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
            attendanceInfo['fullname'].toString(),
          );
          sched.add(loadstaff);
          SchedDaysC.text = loadstaff.work_date;
          timeRange.value = loadstaff.shift_time;
          StatusC.text = loadstaff.status;
          getsched(loadstaff.staff_id);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> addschedule(BuildContext context, String staff_id) async {
    try {
      final response = await Staff().addschedule(
        staff_id,
        SchedDaysC.text,
        timeRange.value,
        fullname.value,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Schedule added successfully.');
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Added Doctor Schedule');
        getsched(staff_id);
        Navigator.of(context).pop();
      } else {
        showErrorToast(context,
            title: 'Oops!', text: 'Schedule Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

  Future<void> updateschedule(
      BuildContext context, String scheduleid, staff_id) async {
    try {
      final response = await Staff().updateschedule(
        scheduleid,
        SchedDaysC.text,
        timeRange.value,
        StatusC.text,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Schedule update successfully.');
        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Update Doctor Schedule');
        clearFields();
        getsched(staff_id);
        Navigator.of(context).pop();
      } else {
        showErrorToast(context,
            title: 'Oops!', text: 'Schedule Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
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
    SchedDaysC.clear();
    timeRange.value = '';
  }

  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  void removeSelectedFile() {
    selectedFile.value = null;
    selectedFileName.value = null;
  }
}
