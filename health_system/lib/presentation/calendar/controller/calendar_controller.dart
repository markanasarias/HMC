import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';

class CalendarController extends GetxController {
  var selectedFileName = ''.obs;
  Helper helper = Helper();

  // Use an EventController to manage events
  final EventController eventController = EventController();

  var calendar = <CalendarModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getloadevent();
  }

  Future<void> getloadevent() async {
    print('loaddoctor');

    try {
      final response = await Calendar().getcalendar();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
      

        for (var attendanceInfo in json.decode(jsondata)) {
          CalendarModel loadcalendar = CalendarModel(
            attendanceInfo['id'].toString(),
            attendanceInfo['name'].toString(),
            attendanceInfo['description'].toString(),
            attendanceInfo['start_time'].toString(),
            attendanceInfo['end_time'].toString(),
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

  void setSelectedFile(String fileName) {
    selectedFileName.value = fileName;
  }

  void removeSelectedFile() {
    selectedFileName.value = '';
  }
}
