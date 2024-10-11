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

class RequestStaffController extends GetxController {
  var branch_id = ''.obs;
  var inventoryItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'].obs;
  var filteredItems = <String>[].obs;
  var textController = TextEditingController();
  var showSuggestions = false.obs;
  Helper helper = Helper();

  var requestsstaff = <RequestStaffModel>[].obs;
   var addedItems = <InventoryItem>[].obs;

  @override
  void onInit() async {
    super.onInit();
    branch_id.value = await helper.getbranchid();
    await getloadrequeststaff();
  }

    void printItemsAsJson() {
    // Convert each InventoryItem to JSON
    var jsonData = addedItems.map((item) => item.toJson()).toList();
    
    // Wrap the list inside a map with key "data"
    var result = {
      "data": jsonData
    };

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
          DateTime createdDate =
              DateTime.parse(itemsinfo['request_date'].toString());

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
            itemsinfo['branch_names'].toString(),
          );

          requestsstaff.add(requestsstaffs);
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
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

  InventoryItem({required this.itemid, required this.itemName, required this.quantity});

  // Convert the InventoryItem class to JSON format
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