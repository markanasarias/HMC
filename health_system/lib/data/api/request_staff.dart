import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class RequestStaffInventory {
  Future<ResponceModel> getrequeststaffinventory(String branch_id) async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadstaffrequest}');
    final response = await http.post(url, body: {
      'branch_id': branch_id,
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

Future<ResponceModel> sendrequeststaffinventory(Map<String, List<Map<String, String>>> items) async {
  final url = Uri.parse('${Config.apiUrl}${Config.staffquestinventory}');
  final itemsJson = json.encode(items);

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json', 
    },
    body: itemsJson, 
  );

  print('items: $itemsJson');

  final responseData = json.decode(response.body);
  final status = response.statusCode;
  final message = responseData['msg'];
  final result = responseData['data'] ?? [];
  final description = responseData['description'] ?? "";

  print(result);
  print(status);
  print(message);
  print(responseData);

  ResponceModel data = ResponceModel(message, status, result, description);
  return data;
}

}