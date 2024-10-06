import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/logs.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/logs_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';

class LogsController extends GetxController {
  Helper helper = Helper();


  var logs = <LogsModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getloadlogs();
  }

  Future<void> getloadlogs() async {
    print('getloadcenter');

    try {
      final response = await Logs().getlogs();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
      

        for (var centerinfo in json.decode(jsondata)) {
           DateTime createdDate = DateTime.parse(centerinfo['created_at'].toString(),);
        
        String formattedDate = DateFormat('dd/MM/yyyy').format(createdDate);
          LogsModel logsinfo = LogsModel(
            centerinfo['log_id'].toString(),
            centerinfo['user_id'].toString(),
            centerinfo['fullname'].toString(),
            centerinfo['action'].toString(),
           formattedDate,
          );
          
          logs.add(logsinfo);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

}
