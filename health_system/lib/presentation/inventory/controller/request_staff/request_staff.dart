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

class RequestStaffController extends GetxController {
  var branch_id = ''.obs;
  var fullname = ''.obs;
  var itemstatus = '';
  var staffid = ''.obs;
  var requestdate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var inventoryItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'].obs;
  var filteredItems = <String>[].obs;
  var textController = TextEditingController();
  var showSuggestions = false.obs;
  Helper helper = Helper();

  var requestsstaff = <RequestStaffModel>[].obs;
  var filteredrequestsstaff = <RequestStaffModel>[].obs;
  var searchQuery = ''.obs;
  var addedItems = <InventoryItem>[].obs;

  @override
  void onInit() async {
    super.onInit();
    branch_id.value = await helper.getbranchid();
    fullname.value = await helper.getfullname();
    staffid.value = await helper.getstaffid();
    await getloadrequeststaff();
  }

  void filterPatients() {
    if (searchQuery.value.isEmpty) {
      filteredrequestsstaff.value = requestsstaff;
    } else {
      List<String> queryParts = searchQuery.value.split(' ');

      filteredrequestsstaff.value = requestsstaff.where((center) {
        if (queryParts.length > 1) {
          return center.item_name
              .toLowerCase()
              .contains(queryParts[0].toLowerCase());
        } else {
          return center.branch_name
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase());
        }
      }).toList();
    }
  }

  void printItemsAsJson() {
    var jsonData = addedItems.map((item) => item.toJson()).toList();
    var result = {"data": jsonData};

    // Print the result in JSON-like format
    print(result);
  }

  Future<void> getloadrequeststaff() async {
    print('getloadcenter');

    try {
      final response = await RequestStaffInventory()
          .getrequeststaffinventory(branch_id.value);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var itemsinfo in json.decode(jsondata)) {
          String dateString = itemsinfo['first_request_date'].toString();
          DateTime createdDate;

          // If the date string contains a 'Z' (UTC), parse it directly
          if (dateString.endsWith('Z')) {
            createdDate = DateTime.parse(dateString);
          } else {
            // If it's not in UTC, you can manually specify a format
            createdDate = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(dateString);
          }

          String formattedDate = DateFormat('dd/MM/yyyy').format(createdDate);

          RequestStaffModel requestsstaffs = RequestStaffModel(
            itemsinfo['request_id'].toString(),
            itemsinfo['item_id'].toString(),
            itemsinfo['item_name'].toString(),
            itemsinfo['requested_quantity'].toString(),
            formattedDate,
            itemsinfo['status'].toString(),
            itemsinfo['requested_by'].toString(),
            itemsinfo['branch_id'].toString(),
            itemsinfo['branch_name'].toString(),
          );

          requestsstaff.add(requestsstaffs);
        }
        filterPatients();
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading request staff data: $e');
    }
  }

  Future<void> addrequest(BuildContext context) async {
    // Validate required fields
    if (addedItems.isEmpty ||
        requestdate.value == null ||
        fullname.value == null ||
        branch_id.value == null) {
      showErrorToast(context,
          title: 'Missing Fields!',
          text:
              'Please fill in all required fields and add at least one item.');
      return;
    }

    try {
      // Prepare the list of items
      var itemsData = addedItems.map((item) {
        return {
          "item_id": item.itemid,
          "requested_quantity": item.quantity,
          "request_date": requestdate.value,
          "status": "Pending",
          "requested_by": fullname.value,
          "branch_id": branch_id.value,
        };
      }).toList();

      var requestData = {"items": itemsData};

      // Send request to API
      final response =
          await RequestStaffInventory().sendrequeststaffinventory(requestData);

      if (response.message == 'success') {
        showSuccessToast(context,
            title: 'Success!', text: 'Request added successfully.');

        final logsController = Get.put(LogsController());
        await logsController.addlogs(staffid.value, 'Request Inventory');
        await Future.delayed(Duration(seconds: 1));

        // Refresh data after success
        getloadrequeststaff();
        Navigator.of(context).pop();
      } else {
        showErrorToast(context,
            title: 'Oops!', text: 'Request already exists!');
      }
    } catch (e) {
      print('An error occurred: $e');
      showErrorToast(context,
          title: 'Oops!', text: 'There was an issue. Please try again.');
    }
  }

  void filterItems(String input) {
    if (input.isEmpty) {
      showSuggestions.value = false;
    } else {
      filteredItems.value = inventoryItems
          .where((item) => item.toLowerCase().contains(input.toLowerCase()))
          .toList();
      showSuggestions.value = true;
    }
  }

  void addItem(String itemid, String itemName, String quantity) {
    addedItems.add(
        InventoryItem(itemid: itemid, itemName: itemName, quantity: quantity));
  }

  void removeItem(InventoryItem item) {
    addedItems.remove(item);
  }
}

class AddedItem {
  String itemName;
  String quantity;

  AddedItem({required this.itemName, required this.quantity});
}

class InventoryItem {
  final String itemid;
  final String itemName;
  final String quantity;

  InventoryItem(
      {required this.itemid, required this.itemName, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'itemid': itemid,
      'itemName': itemName,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return 'ItemID: $itemid,  Item: $itemName, Quantity: $quantity';
  }
}
