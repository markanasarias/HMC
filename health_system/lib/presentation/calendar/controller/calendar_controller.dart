import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
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

class CalendarController extends GetxController {
  var selectedFileName = ''.obs;
  var start_date = ''.obs;
  var end_date = ''.obs;
  var fullname = ''.obs;
  Helper helper = Helper();

  // Use an EventController to manage events
  final EventController eventController = EventController();
  final TextEditingController NameC = TextEditingController();
  final TextEditingController DescriptionC = TextEditingController();
  final TextEditingController LocationC = TextEditingController();
  final TextEditingController StatusC = TextEditingController();

  var calendar = <CalendarModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    await getloadevent();
  }

  Future<void> getloadevent() async {
    print('loaddoctor');

    try {
      final response = await Calendar().getcalendar();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var attendanceInfo in json.decode(jsondata)) {
          // Parse the start_time and end_time
          DateTime startTimes = DateTime.parse(attendanceInfo['start_time']);
          DateTime endTimes = DateTime.parse(attendanceInfo['end_time']);

          // Format the date to "yyyy-MM-dd HH:mm:ss"
          String formattedStartTime =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(startTimes);
          String formattedEndTime =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(endTimes);

          CalendarModel loadcalendar = CalendarModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['name'].toString(),
            attendanceInfo['description'].toString(),
            formattedStartTime, // Use formatted time here
            formattedEndTime, // Use formatted time here
            attendanceInfo['location'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
          );

          calendar.add(loadcalendar);

          DateTime startTime = DateTime.parse(loadcalendar.start_time);
          DateTime endTime = DateTime.parse(loadcalendar.end_time);

          eventController.add(CalendarEventData(
            title: loadcalendar.name,
            description: loadcalendar.description,
            startTime: startTime,
            endTime: endTime,
            date: startTime,
          ));
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> selectevents(String date) async {
    print('loaddoctor');
    calendar.clear();
    try {
      final response = await Calendar().getevents(date);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var attendanceInfo in json.decode(jsondata)) {
          // Parse the start_time and end_time
          DateTime startTime = DateTime.parse(attendanceInfo['start_time']);
          DateTime endTime = DateTime.parse(attendanceInfo['end_time']);

          // Format the date to "yyyy-MM-dd HH:mm:ss"
          String formattedStartTime =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(startTime);
          String formattedEndTime =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(endTime);
          CalendarModel loadcalendar = CalendarModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['name'].toString(),
            attendanceInfo['description'].toString(),
            formattedStartTime, // Use formatted time here
            formattedEndTime, // Use formatted time here
            attendanceInfo['location'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
          );

          calendar.add(loadcalendar);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> selectevent(String id) async {
    print('loaddoctor');
    calendar.clear();

    try {
      final response = await Calendar().selectevent(id);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var attendanceInfo in json.decode(jsondata)) {
          // Parse the start_time and end_time
          DateTime startTime = DateTime.parse(attendanceInfo['start_time']);
          DateTime endTime = DateTime.parse(attendanceInfo['end_time']);

          // Format the date to "yyyy-MM-dd HH:mm:ss"
          String formattedStartTime =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(startTime);
          String formattedEndTime =
              DateFormat('yyyy-MM-dd HH:mm:ss').format(endTime);

          CalendarModel loadcalendar = CalendarModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['name'].toString(),
            attendanceInfo['description'].toString(),
            formattedStartTime, // Use formatted time here
            formattedEndTime, // Use formatted time here
            attendanceInfo['location'].toString(),
            attendanceInfo['createby'].toString(),
            attendanceInfo['createddate'].toString(),
          );

          calendar.add(loadcalendar);
          NameC.text = loadcalendar.name;
          DescriptionC.text = loadcalendar.description;
          start_date.value = loadcalendar.start_time;
          end_date.value = loadcalendar.end_time;
          LocationC.text = loadcalendar.location;
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> addevent(BuildContext context) async {
    //isloading = true.obs;
    try {
      final response = await Calendar().savecalendar(
          NameC.text,
          DescriptionC.text,
          start_date.value,
          end_date.value,
          LocationC.text,
          fullname.value);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Event added successfully.');
        await Future.delayed(Duration(seconds: 1));
        //isloading = false.obs;
        getloadevent();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Event Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

  Future<void> updateevent(BuildContext context, String id) async {
    //isloading = true.obs;
    try {
      final response = await Calendar().updatecalendar(id, NameC.text,
          DescriptionC.text, start_date.value, end_date.value, LocationC.text);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Event update successfully.');
        await Future.delayed(Duration(seconds: 1));
        //isloading = false.obs;
        getloadevent();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Items Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  void removeSelectedFile() {
    selectedFileName.value = '';
  }
}
