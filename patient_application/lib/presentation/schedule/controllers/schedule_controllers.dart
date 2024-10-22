// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:patient_application/data/api/schedule.dart';
import 'package:patient_application/data/model/schedule_model.dart';
import 'package:patient_application/presentation/schedule/pages/schedule.dart';
import 'package:patient_application/repository/repository.dart';

class ScheduleControllers extends GetxController {
  var seletedday = 'Monday'.obs;
  var day = ''.obs;
  Helper helper = Helper();
  var sched = <ScheduleModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await gethomesched();
    updateCurrentDay();
    await getsched();
  }

  void updateCurrentDay() {
    // List of days of the week
    List<String> daysOfWeek = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    // Get the current day of the week
    int currentDayIndex = DateTime.now().weekday; // 1 = Monday, ..., 7 = Sunday
    day.value = daysOfWeek[currentDayIndex % 7]; // Adjust for 0-based inde
  }

  Future<void> getsched() async {
    print('Load doctor schedule for $seletedday');
    sched.clear();
    try {
      final response = await Staff().loadschedule(seletedday.value);

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

  Future<void> gethomesched() async {
    print('Load home schedule for $seletedday');
    sched.clear();
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
