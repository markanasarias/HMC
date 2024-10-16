// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:patient_application/data/api/center.dart';
import 'package:patient_application/data/model/center_model.dart';
import 'package:patient_application/repository/repository.dart';

class CenterControllers extends GetxController {
  var activelocation = LatLng(0.0, 0.0).obs;

  var center = <CenterModel>[].obs;

  Helper helper = Helper();

  @override
  void onInit() async {
    super.onInit();
    // fullname.value = await helper.getfullname();
    // staffid.value = await helper.getstaffid();
    await getloadcenter();
  }

  Future<void> getloadcenter() async {
    print('getloadcenter');
    center.clear();
    try {
      final response = await BranchCenter().getcenter();

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var centerinfo in json.decode(jsondata)) {
          CenterModel loadcenter = CenterModel(
            centerinfo['branch_id'].toString(),
            centerinfo['branch_name'].toString(),
            centerinfo['address'].toString(),
            centerinfo['createddate'].toString(),
            centerinfo['createdby'].toString(),
            centerinfo['status'].toString(),
            double.tryParse(centerinfo['latitude'].toString()) ??
                0.0, // Convert to double
            double.tryParse(centerinfo['longitude'].toString()) ??
                0.0, // Convert to double
          );

          center.add(loadcenter);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading center data: $e');
    }
  }
}
