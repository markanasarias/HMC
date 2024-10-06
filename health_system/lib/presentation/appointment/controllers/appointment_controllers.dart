import 'dart:convert';
import 'package:get/get.dart';
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


class AppointmentControllers extends GetxController {
  var branch_id = ''.obs;
  var staffid = ''.obs;
  Helper helper = Helper();


  var appointment = <AppointmentModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
     branch_id.value = await helper.getbranchid();
     staffid.value = (await helper.getstaffid()).toString();
    await getloadappointment();
  }

Future<void> getloadappointment() async {
  print('getloadcenter');

  try {
    final response = await Appointment().getappointment(staffid.value, staffid.value);

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

}
