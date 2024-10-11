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
import 'package:health_system/presentation/logs/controller/logs_controller.dart'; // Import LogsController

class CenterController extends GetxController {
  var selectedFileName = ''.obs;
  var fullname = ''.obs;
  var staffid = ''.obs;
  var isloading = false.obs;
  var branchId = ''.obs;
  var branchName = ''.obs;
  var selectedBranchId = ''.obs;
  Helper helper = Helper();
  final TextEditingController NameC = TextEditingController();
  final TextEditingController LocationC = TextEditingController();
 final TextEditingController StatusC = TextEditingController();
  var center = <CenterModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    fullname.value = await helper.getfullname();
    staffid.value = await helper.getstaffid();
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
          );

          center.add(loadcenter);
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
            centerinfo['createddate'].toString(),
            centerinfo['createdby'].toString(),
            centerinfo['status'].toString(),
          );

          center.add(loadcenter);
          NameC.text = loadcenter.branch_name;
          LocationC.text = loadcenter.address;
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
  }

  Future<void> addcenter(BuildContext context) async {
    isloading.value = true;
    try {
      final response = await BranchCenter()
          .addcenter( NameC.text, LocationC.text, fullname.value);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Center added successfully.');
        await Future.delayed(Duration(seconds: 1));

        final logsController = Get.put(LogsController());
        await logsController.addlogs(context, staffid.value, 'Added center');

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
      isloading.value = false; // Update loading state
    }
  }
    Future<void> updatecenter(BuildContext context, String branch_id) async {
    isloading.value = true;
    try {
      final response = await BranchCenter()
          .updatecenter(branch_id, NameC.text, LocationC.text, StatusC.text);
      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Center updated successfully.');
        await Future.delayed(Duration(seconds: 1));

        final logsController = Get.put(LogsController());
        await logsController.addlogs(context, staffid.value, 'Updated center');

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
      isloading.value = false; // Update loading state
    }
  }
}
