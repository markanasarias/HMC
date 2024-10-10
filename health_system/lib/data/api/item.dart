import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Items {
  Future<ResponceModel> getitems() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loaditems}');
    final response = await http.get(url);

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

    Future<ResponceModel> saveitems(String item_name, String item_type, String created_by,) async {
    final url = Uri.parse('${Config.apiUrl}${Config.saveitems}');
    final response = await http.post(url, body: {
      'item_name': item_name,
      'item_type': item_type,
      'created_by': created_by,
    });

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

      Future<ResponceModel> selectitems(String item_id,) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectitems}');
    final response = await http.post(url, body: {
      'item_id': item_id,
    });

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }
}