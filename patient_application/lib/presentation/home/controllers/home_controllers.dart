// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:patient_application/data/api/center.dart';
import 'package:patient_application/data/api/medical_records.dart';
import 'package:patient_application/data/model/center_model.dart';
import 'package:patient_application/data/model/medical_model.dart';
import 'package:patient_application/repository/repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:patient_application/data/api/schedule.dart';
import 'package:patient_application/data/model/schedule_model.dart';
import 'package:patient_application/presentation/schedule/pages/schedule.dart';
import 'package:patient_application/repository/repository.dart';

class HomeControllers extends GetxController {
  var currentIndex = 0.obs;
  var getpatient_id = ''.obs;
  var activelocation = LatLng(0.0, 0.0).obs;
  var fname = ''.obs;
   var lname = ''.obs;
    var mname = ''.obs;
  RxBool isLoading = true.obs;
  RxString fileUrl = ''.obs;
    var seletedday = 'Monday'.obs;
  var day = ''.obs;

  Helper helper = Helper();
  var sched = <ScheduleModel>[].obs;

  var record = <MedicalRecordModel>[].obs;

  @override
  void onInit() async {
    super.onInit();

  fname.value = await helper.fname();
  lname.value = await helper.lname();
  mname.value = await helper.mname();
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
  print('Today is: $dayOfWeek'); 
  day.value = dayOfWeek;
  await gethomesched();
    
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }
    Future<void> gethomesched() async {
    sched.clear();
    print('day ngayon ${day.value}');
    try {
      final response = await Staff().loadschedule(day.value);

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
}
