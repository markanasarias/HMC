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

class HomeControllers extends GetxController {
  var currentIndex = 0.obs;
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
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
