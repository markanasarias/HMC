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

class ServiceController extends GetxController {
  Helper helper = Helper();


  var service = <ServiceModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getloadservice();
  }

  Future<void> getloadservice() async {
    print('getloadcenter');

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

}
