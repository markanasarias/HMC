import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Logs {
  Future<ResponceModel> getlogs() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadlogs}');
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

  Future<ResponceModel> savelogs(String user_id, String action) async {
    final url = Uri.parse('${Config.apiUrl}${Config.savelogs}');
    final response = await http.post(url, body: {
      'user_id': user_id,
      'action': action,
    });

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(message);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }
}
