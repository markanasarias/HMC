import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/item.dart';
import 'package:health_system/data/api/stocks.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/items_model.dart';
import 'package:health_system/data/model/stocks.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';


class StocksController extends GetxController {
  var branch_id = ''.obs;
  Helper helper = Helper();
var selectedcenter = 'Branch1'.obs;
final center = ['Branch1', 'Branch2', 'Branch3'];
  var stocks = <StocksModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
     branch_id.value = await helper.getbranchid();
    await getloadstocks();
  }

Future<void> getloadstocks() async {
  print('getloadcenter');

  try {
    final response = await Stocks().getstocks(branch_id.value);

    if (helper.getStatusString(APIStatus.success) == response.message) {
      final jsondata = json.encode(response.result);

      for (var itemsinfo in json.decode(jsondata)) {
        DateTime createdDate = DateTime.parse(itemsinfo['createddate'].toString());
        
        String formattedDate = DateFormat('dd/MM/yyyy').format(createdDate);
         DateTime expiry_date = DateTime.parse(itemsinfo['expiry_date'].toString());
        
        String formattedexpiry_date = DateFormat('dd/MM/yyyy').format(createdDate);

        StocksModel stock = StocksModel(
          itemsinfo['item_id'].toString(),
          itemsinfo['item_name'].toString(),
          itemsinfo['category'].toString(),
          itemsinfo['quantity'].toString(),
          formattedDate,
          itemsinfo['purchase_date'].toString(),
          formattedexpiry_date,
          itemsinfo['createby'].toString(),
          itemsinfo['branch_id'].toString(),
          itemsinfo['status'].toString(),
        );

        stocks.add(stock);
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}

}
