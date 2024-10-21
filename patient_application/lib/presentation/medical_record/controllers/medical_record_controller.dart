// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:patient_application/data/api/center.dart';
import 'package:patient_application/data/api/medical_records.dart';
import 'package:patient_application/data/model/center_model.dart';
import 'package:patient_application/data/model/medical_model.dart';
import 'package:patient_application/repository/repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';

class MedicalRecordController extends GetxController {
  var getpatient_id = ''.obs;
  var activelocation = LatLng(0.0, 0.0).obs;
    RxBool isLoading = true.obs;
  RxString fileUrl = ''.obs;

  var record = <MedicalRecordModel>[].obs;

  Helper helper = Helper();

  @override
  void onInit() async {
    super.onInit();
    getpatient_id.value = await helper.getpatient_id();
    await getloadrecord();
  }

    Future<void> fetchFile(String fileName) async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.7:3000/patient/getfile?filename=$fileName'),
      );

      if (response.statusCode == 200) {
        // File fetched successfully, convert to base64
        final fileBytes = response.bodyBytes;
        final base64String = base64Encode(fileBytes);
        fileUrl.value = 'data:application/pdf;base64,$base64String';
      } else {
        // File not found or failed
        Get.snackbar('Error', 'File not found or unable to fetch.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while fetching the file.');
    } finally {
      isLoading.value = false;
    }
  }

Future<void> getloadrecord() async {
  print('getloadcenter');
  record.clear();
  try {
    final response = await MedicalRecords().getrecord(getpatient_id.value);

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);

      for (var centerinfo in json.decode(jsondata)) {
        // Parse the created_date to a DateTime object
        DateTime parsedDate = DateTime.parse(centerinfo['created_date'].toString());

        // Format the created_date to 'October 17, 2024'
        String formattedDate = DateFormat('MMMM dd, yyyy').format(parsedDate);

        MedicalRecordModel loadcenter = MedicalRecordModel(
          centerinfo['id'].toString(),
          centerinfo['patient_id'].toString(),
          centerinfo['medical_record'].toString(),
          centerinfo['file'].toString(),
          centerinfo['status'].toString(),
          centerinfo['created_by'].toString(),
          formattedDate, // Use the formatted date here
          centerinfo['file_name'].toString(),
          centerinfo['full_name'].toString(),
        );

        record.add(loadcenter);
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading center data: $e');
  }
}
}
