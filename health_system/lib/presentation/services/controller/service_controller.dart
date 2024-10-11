import 'dart:convert';

import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/service.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/service_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
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

class ServiceController extends GetxController {
  var fullname = ''.obs;
  var schedule_days = ''.obs;
  var schedule_time = ''.obs;
  Helper helper = Helper();

  var service = <ServiceModel>[].obs;

  final TextEditingController NameC = TextEditingController();
  final TextEditingController StatusC = TextEditingController();
  final TextEditingController daysC = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    await getloadservice();
  }

  Future<void> getloadservice() async {
    print('getloadcenter');
    service.clear();
    try {
      final response = await Service().getservice();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var centerinfo in json.decode(jsondata)) {
          ServiceModel services = ServiceModel(
            centerinfo['id'].toString(),
            centerinfo['service_name'].toString(),
            centerinfo['schedule_days'].toString(),
            centerinfo['schedule_time'].toString(),
            centerinfo['status'].toString(),
            centerinfo['created_by'].toString(),
            centerinfo['created_date'].toString(),
          );

          service.add(services);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> selectservice(String id) async {
    print('getloadcenter');
    try {
      final response = await Service().selectservices(id);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);
        for (var centerinfo in json.decode(jsondata)) {
          ServiceModel services = ServiceModel(
            centerinfo['id'].toString(),
            centerinfo['service_name'].toString(),
            centerinfo['schedule_days'].toString(),
            centerinfo['schedule_time'].toString(),
            centerinfo['status'].toString(),
            centerinfo['created_by'].toString(),
            centerinfo['created_date'].toString(),
          );

          service.add(services);
          NameC.text = services.service_name;
          daysC.text = services.schedule_days;
          schedule_time.value = services.schedule_time;
          StatusC.text = services.status;
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> addservice(BuildContext context) async {
    //isloading = true.obs;
    try {
      final response = await Service().saveservice(
          NameC.text, schedule_days.value, schedule_time.value, fullname.value);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Service added successfully.');
        getloadservice();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Service Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }
    Future<void> updateservice(BuildContext context, String id) async {
    //isloading = true.obs;
    try {
      final response = await Service().updateservice(
          id,NameC.text, daysC.text, schedule_time.value, StatusC.text);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Service added successfully.');
        getloadservice();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Service Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }
}
