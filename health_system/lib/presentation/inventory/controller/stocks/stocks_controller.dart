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
  var usertype = ''.obs;
  var staffid = ''.obs;
  Helper helper = Helper();
  var selectedbranch = ''.obs;
  final center = ['Branch1', 'Branch2', 'Branch3'];
  var stocks = <StocksModel>[].obs;
  var filteredstocks = <StocksModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    branch_id.value = await helper.getbranchid();
    usertype.value = await helper.gettype();
    staffid.value = await helper.getstaffid();
    print('usertype.value ${usertype.value}');
    await getloadstocks(branch_id.value);
  }

  void reload() async {
    stocks.clear();
    await getloadstocks(branch_id.value);
  }

  void filterPatients() {
    if (searchQuery.value.isEmpty) {
      filteredstocks.value = stocks;
    } else {
      List<String> queryParts = searchQuery.value.split(' ');

      filteredstocks.value = stocks.where((stocks) {
        if (queryParts.length > 1) {
          return stocks.item_name
                  .toLowerCase()
                  .contains(queryParts[0].toLowerCase()) ||
              stocks.quantity
                  .toLowerCase()
                  .contains(queryParts[1].toLowerCase());
        } else {
          return stocks.item_name
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              stocks.quantity
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase());
        }
      }).toList();
    }
  }

  Future<void> getloadstocks(branch_id) async {
    print('getloadcenter');
    stocks.clear();
    try {
      final response = await Stocks().getstocks(branch_id);

      if (helper.getStatusString(APIStatus.success) == response.message) {
        final jsondata = json.encode(response.result);

        for (var itemsinfo in json.decode(jsondata)) {
          // Print raw createddate and expiry_date to debug
          print('Raw createddate: ${itemsinfo['createddate']}');
          print('Raw expiry_date: ${itemsinfo['expiry_date']}');

          // Try parsing createddate and expiry_date
          DateTime createdDate;
          DateTime expiryDate;

          try {
            createdDate = DateTime.parse(itemsinfo['createddate'].toString());
          } catch (e) {
            print('Error parsing createddate: ${itemsinfo['createddate']}');
            createdDate = DateTime.now(); // Default value
          }

          try {
            expiryDate = DateTime.parse(itemsinfo['expiry_date'].toString());
          } catch (e) {
            print('Error parsing expiry_date: ${itemsinfo['expiry_date']}');
            expiryDate = DateTime.now(); // Default value
          }

          // Format dates using DateFormat
          String formattedCreatedDate =
              DateFormat('dd/MM/yyyy').format(createdDate);
          String formattedExpiryDate =
              DateFormat('dd/MM/yyyy').format(expiryDate);

          // Create StocksModel object
          StocksModel stock = StocksModel(
            itemsinfo['item_id'].toString(),
            itemsinfo['item_name'].toString(),
            itemsinfo['category'].toString(),
            itemsinfo['quantity'].toString(),
            itemsinfo['stock_limit'].toString(),
            formattedCreatedDate,
            itemsinfo['purchase_date'].toString(),
            formattedExpiryDate,
            itemsinfo['createby'].toString(),
            itemsinfo['branch_id'].toString(),
            itemsinfo['status'].toString(),
          );

          stocks.add(stock);
        }
        filterPatients();
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }
}
