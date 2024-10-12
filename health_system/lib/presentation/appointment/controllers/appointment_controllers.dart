import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/appointment.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/api/stocks.dart';
import 'package:health_system/data/model/appointment_model.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
import 'package:health_system/data/model/stocks.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
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

class AppointmentControllers extends GetxController {
  var branch_id = ''.obs;
  var fullname = ''.obs;
  var staffid = ''.obs;
  var startdate = ''.obs;
  var enddate = ''.obs;
  var selecteddoctor = ''.obs;
  Helper helper = Helper();

  var appointment = <AppointmentModel>[].obs;
  var staff = <StaffModel>[].obs;

  final TextEditingController purpose = TextEditingController();
  final TextEditingController doctorname = TextEditingController();
  final TextEditingController StatusC = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    branch_id.value = await helper.getbranchid();
    staffid.value = (await helper.getstaffid()).toString();
    await getloadappointment();
    await getdoctor();
  }

  Future<void> getloadappointment() async {
    print('getloadcenter');
    appointment.clear();
    try {
      final response =
          await Appointment().getappointment(staffid.value, staffid.value);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var itemsinfo in json.decode(jsondata)) {
          AppointmentModel appoinments = AppointmentModel(
            itemsinfo['appointment_id'],
            itemsinfo['staff_id'],
            itemsinfo['staff_fullname'],
            itemsinfo['requestedby'],
            itemsinfo['requestedby_fullname'],
            itemsinfo['purpose'].toString(),
            itemsinfo['startdate'].toString(),
            itemsinfo['enddate'].toString(),
            itemsinfo['status'].toString(),
            itemsinfo['created_by'].toString(),
            itemsinfo['created_date'].toString(),
          );

          appointment.add(appoinments);
          doctorname.text = appoinments.staff_fullname;
          purpose.text = appoinments.purpose;
          startdate.value = appoinments.startdate;
          enddate.value = appoinments.enddate;
          StatusC.text = appoinments.status;
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> selectappointment(String appointment_id) async {
    print('getloadcenter');

    try {
      final response = await Appointment().selectappointment(appointment_id);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var itemsinfo in json.decode(jsondata)) {
          AppointmentModel appoinments = AppointmentModel(
            itemsinfo['appointment_id'],
            itemsinfo['staff_id'],
            itemsinfo['staff_fullname'],
            itemsinfo['requestedby'],
            itemsinfo['requestedby_fullname'],
            itemsinfo['purpose'].toString(),
            itemsinfo['startdate'].toString(),
            itemsinfo['enddate'].toString(),
            itemsinfo['status'].toString(),
            itemsinfo['created_by'].toString(),
            itemsinfo['created_date'].toString(),
          );

          appointment.add(appoinments);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  Future<void> getdoctor() async {
    print('loaddoctor');
    try {
      final response = await Staff().getdoctor();

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

  Future<void> addappointment(BuildContext context) async {
    try {
      final response = await Appointment().addappointment(
        selecteddoctor.value,
        staffid.value,
        purpose.text,
        startdate.value,
        enddate.value,
        StatusC.text,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Appointment added successfully.');
        getloadappointment();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context,
            title: 'Oops!', text: 'Appointment Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

  Future<void> updateappointment(BuildContext context, appointment_id) async {
    try {
      final response = await Appointment().updateappointment(
        appointment_id,
        purpose.text,
        startdate.value,
        enddate.value,
        fullname.value,
      );
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Appointment update successfully.');
        getloadappointment();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context,
            title: 'Oops!', text: 'Appointment Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }
}
