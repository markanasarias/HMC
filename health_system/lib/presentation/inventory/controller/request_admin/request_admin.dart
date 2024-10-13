import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/api/request_admin.dart';
import 'package:health_system/data/api/request_staff.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
import 'package:health_system/data/model/request_admin_model.dart';
import 'package:health_system/data/model/request_staff_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/api/request_staff.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
import 'package:health_system/data/model/request_staff_model.dart';
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


class RequestAdmin extends GetxController {
  var branch_id = ''.obs;
  var requestbranch_id = ''.obs;
  Helper helper = Helper();

  final TextEditingController Quantity = TextEditingController();


  var requestsadmin = <RequestAdminModel>[].obs;
  var viewrequestsadmin = <ViewRequestAdminModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    branch_id.value = await helper.getbranchid();
    await getloadrequestadmin();
  }

    void reload() async {
    viewrequestsadmin.clear();
    await getloadrequestadmin();
  }


Future<void> getloadrequestadmin() async {
  print('getloadcenter');
requestsadmin.clear();
  try {
    final response = await RequestAdminInventory().getrequestadmininventory();

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);

      for (var itemsinfo in json.decode(jsondata)) {
        DateTime first_request_date = DateTime.parse(itemsinfo['first_request_date'].toString());
        String formattedfirstDate = DateFormat('dd/MM/yyyy').format(first_request_date);
        DateTime last_request_date = DateTime.parse(itemsinfo['last_request_date'].toString());
        String formattedlastDate = DateFormat('dd/MM/yyyy').format(last_request_date);
        RequestAdminModel requestsadmins = RequestAdminModel(
          itemsinfo['branch_id'].toString(),
          itemsinfo['branch_name'].toString(),
          itemsinfo['total_requests'].toString(),
          itemsinfo['total_requested_quantity'].toString(),
          formattedfirstDate,
          formattedlastDate,
          itemsinfo['latest_status'].toString(),
          itemsinfo['last_requested_by'].toString(),
          
        );

        requestsadmin.add(requestsadmins);
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}

Future<void> getviewrequest() async {
  print('getloadcenter');
  viewrequestsadmin.clear();
  try {
    final response = await RequestAdminInventory().getviewrequest(requestbranch_id.value);

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);

      for (var itemsinfo in json.decode(jsondata)) {
        // Parse the date correctly
        DateTime first_request_date = DateTime.parse(itemsinfo['first_request_date'].toString());

        // Format the date as 'dd/MM/yyyy'
        String formattedfirstDate = DateFormat('dd/MM/yyyy').format(first_request_date);

        Quantity.text = itemsinfo['requested_quantity'].toString();

        ViewRequestAdminModel viewrequestsadmins = ViewRequestAdminModel(
          itemsinfo['request_id'].toString(),
          itemsinfo['item_id'].toString(),
          itemsinfo['item_name'].toString(),
          itemsinfo['requested_quantity'].toString(),
          formattedfirstDate,  // formatted date
          itemsinfo['status'].toString(),
          itemsinfo['requested_by'].toString(),
          itemsinfo['branch_id'].toString(),
        );

        viewrequestsadmin.add(viewrequestsadmins);
      
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}


    Future<void> approvedrequest(BuildContext context) async {
  try {
    // Prepare the list of items
    var itemsData = viewrequestsadmin.map((item) {
      return {
        "request_id": item.request_id,               
        "requested_quantity": item.requested_quantity,
        "item_id": item.item_id, 
        "branch_id": item.branch_id,            
      };
    }).toList();


    var requestData = {
      "items": itemsData
    };
    final response = await RequestAdminInventory().approvedrequeststaffinventory(requestData);

    if (response.message == 'success') {
      showSuccessToast(context,
          title: 'Success!', text: 'Request Approved successfully.');
      await Future.delayed(Duration(seconds: 1));

      // If you have additional logic, like adding logs or reloading data:
      // final logsController = Get.put(LogsController());
      // await logsController.addlogs(context, staffid.value, 'Added request');
      getviewrequest();
      Navigator.of(context).pop();
    } else {
      showErrorToast(context, title: 'Oops!', text: 'Request already exists!');
    }
  } catch (e) {
    print('An error occurred: $e');
    showErrorToast(context,
        title: 'Oops!', text: 'There was an issue. Please try again.');
  }
}
}
