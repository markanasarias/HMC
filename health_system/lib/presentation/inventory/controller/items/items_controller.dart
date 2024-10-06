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


class ItemsController extends GetxController {
  Helper helper = Helper();


  var item = <ItemsModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getloaditems();
  }

Future<void> getloaditems() async {
  print('getloadcenter');

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

}
