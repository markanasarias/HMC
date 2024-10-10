import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
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
import 'package:calendar_view/calendar_view.dart';
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


class ItemsController extends GetxController {
  var fullname = ''.obs;
  Helper helper = Helper();


  var item = <ItemsModel>[].obs;
  final TextEditingController NameC = TextEditingController();
  final TextEditingController TypeC = TextEditingController();
  final TextEditingController Status = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
     fullname.value = await helper.getfullname();
    await getloaditems();
  }

Future<void> getloaditems() async {
  print('getloadcenter');
item.clear();
  try {
    final response = await Items().getitems();

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);

      for (var itemsinfo in json.decode(jsondata)) {
        DateTime createdDate = DateTime.parse(itemsinfo['created_date'].toString());
        
        String formattedDate = DateFormat('dd/MM/yyyy').format(createdDate);

        ItemsModel items = ItemsModel(
          itemsinfo['item_id'].toString(),
          itemsinfo['item_name'].toString(),
          itemsinfo['item_type'].toString(),
          itemsinfo['created_by'].toString(),
          formattedDate,
          itemsinfo['status'].toString(),
        );

        item.add(items);
        
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}

Future<void> selectitems(String item_id) async {
  print('getloadcenter');

  try {
    final response = await Items().selectitems(item_id);

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);

      for (var itemsinfo in json.decode(jsondata)) {
        DateTime createdDate = DateTime.parse(itemsinfo['created_date'].toString());
        
        String formattedDate = DateFormat('dd/MM/yyyy').format(createdDate);

        ItemsModel items = ItemsModel(
          itemsinfo['item_id'].toString(),
          itemsinfo['item_name'].toString(),
          itemsinfo['item_type'].toString(),
          itemsinfo['created_by'].toString(),
          formattedDate,
          itemsinfo['status'].toString(),
        );

        item.add(items);
        NameC.text = items.item_name;
        TypeC.text = items.item_type;
        Status.text = items.status;
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}


Future<void> addcenter(BuildContext context) async {
  //isloading = true.obs;
  try {
    final response = await Items().saveitems(NameC.text, TypeC.text, fullname.value);
    if (response.message == 'success') {
      showSuccessToast(context, title: 'Success!', text: 'Items added successfully.');
      await Future.delayed(Duration(seconds: 1));
      //isloading = false.obs;
      getloaditems();
       Navigator.of(context).pop();
    } else {
      showErrorToast(context, title: 'Oops!', text: 'Items Already Exist!');
    }
  } catch (e) {
    print('An error occurred: $e');
    showErrorToast(context, title: 'Oops!', text: 'There was an issue. Please try again.');
  }
}

}
