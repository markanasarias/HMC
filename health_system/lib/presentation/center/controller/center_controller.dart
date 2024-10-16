import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/repository/helper.dart';
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
import 'package:health_system/presentation/logs/controller/logs_controller.dart';
import 'package:latlong2/latlong.dart';

class CenterController extends GetxController {
  var selectedFileName = ''.obs;
  var fullname = ''.obs;
  var staffid = ''.obs;
  var isloading = false.obs;
  var branchId = ''.obs;
  var branchName = ''.obs;
  var selectedBranchId = ''.obs;
  var selectedBranchId1 = Rxn<String>();
  var clickedLocation = Rxn<LatLng>();
  var activelocation = LatLng(0.0, 0.0).obs;
  Helper helper = Helper();
  final TextEditingController NameC = TextEditingController();
  final TextEditingController LocationC = TextEditingController();
  final TextEditingController StatusC = TextEditingController();
  final TextEditingController longitudeC = TextEditingController();
  final TextEditingController latitudeC = TextEditingController();
  var center = <CenterModel>[].obs;
  var filteredcenter = <CenterModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    staffid.value = await helper.getstaffid();
    await getloadcenter();
  }

  void filterPatients() {
    if (searchQuery.value.isEmpty) {
      filteredcenter.value = center;
    } else {
      List<String> queryParts = searchQuery.value.split(' ');

      filteredcenter.value = center.where((center) {
        if (queryParts.length > 1) {
          return center.branch_name
                  .toLowerCase()
                  .contains(queryParts[0].toLowerCase()) &&
              center.address
                  .toLowerCase()
                  .contains(queryParts[1].toLowerCase());
        } else {
          return center.branch_name
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              center.address
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase());
        }
      }).toList();
    }
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
            centerinfo['address']?.toString() ?? '',
            _parseToDouble(centerinfo['latitude']),
            _parseToDouble(centerinfo['longitude']),
            centerinfo['createdby']?.toString() ?? '',
            centerinfo['createddate']?.toString() ?? '',
            centerinfo['status']?.toString() ?? '',
          );

          center.add(loadcenter);
        }
        filterPatients();
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

// Helper function to parse latitude and longitude safely
  double _parseToDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ??
          0.0; // If string, try to parse it as double
    } else if (value is double) {
      return value; // If already double, return it
    } else {
      return 0.0; // Fallback if value is neither string nor double
    }
  }

  Future<void> selectcenter(String branch_id) async {
    print('getloadcenter');
    try {
      final response = await BranchCenter().selectcenter(branch_id);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var centerinfo in json.decode(jsondata)) {
          CenterModel loadcenter = CenterModel(
            centerinfo['branch_id'].toString(),
            centerinfo['branch_name'].toString(),
            centerinfo['address'].toString(),
            _parseToDouble(centerinfo['latitude']),
            _parseToDouble(centerinfo['longitude']),
            centerinfo['createddate'].toString(),
            centerinfo['createdby'].toString(),
            centerinfo['status'].toString(),
          );

          center.add(loadcenter);
          NameC.text = loadcenter.branch_name;
          LocationC.text = loadcenter.address;
          StatusC.text = loadcenter.status;
          latitudeC.text = loadcenter.latitude.toString();
          longitudeC.text = loadcenter.longitude.toString();
          StatusC.text = loadcenter.status;
        }

        if (center.isNotEmpty) {
          selectedBranchId.value = center.first.branch_id;
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

  void clear() {
    NameC.clear();
    LocationC.clear();
    longitudeC.clear();
    latitudeC.clear();
    StatusC.clear();
  }

  Future<void> addcenter(BuildContext context) async {
    // Validate required fields before proceeding
    if (NameC.text.isEmpty ||
        LocationC.text.isEmpty ||
        fullname.value == null) {
      showErrorToast(context,
          title: 'Missing Fields!',
          text: 'Please fill in all required fields.');
      return;
    }

    isloading.value = true;

    try {
      final response = await BranchCenter().addcenter(NameC.text,
          LocationC.text, latitudeC.text, longitudeC.text, fullname.value);

      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Center added successfully.');
        await Future.delayed(Duration(seconds: 1));

        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Added center');

        getloadcenter();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Center Already Exists!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    } finally {
      isloading.value = false; // Ensure loading state is reset
    }
  }

  Future<void> updatecenter(BuildContext context, String branch_id) async {
    isloading.value = true;
    try {
      final response = await BranchCenter().updatecenter(branch_id, NameC.text,
          LocationC.text, latitudeC.text, longitudeC.text, StatusC.text);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Center updated successfully.');
        await Future.delayed(Duration(seconds: 1));

        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Updated center');

        isloading.value = false;
        getloadcenter();

        Navigator.of(context).pop();
      } else {
        showErrorToast(context, title: 'Oops!', text: 'Center Already Exist!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
      isloading.value = false;
    }
  }
}
