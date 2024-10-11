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
    logs.clear();

    try {
      final response = await Logs().getlogs();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var centerinfo in json.decode(jsondata)) {
          DateTime createdDate = DateTime.parse(
            centerinfo['created_at'].toString(),
          );

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

  Future<void> addlogs(
      BuildContext context, String user_id, String action) async {
    //isloading = true.obs;
    try {
      final response = await Logs().savelogs(
        user_id,
        action,
      );
      if (response.message == 'success') {
        await getloadlogs();
      } else {}
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
