import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<ResponceModel> getservice() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadservice}');
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

  Future<ResponceModel> saveservice(
    String service_name,
    String schedule_days,
    String schedule_time,
    String created_by,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.saveservices}');
    final response = await http.post(url, body: {
      'service_name': service_name,
      'schedule_days': schedule_days,
      'schedule_time': schedule_time,
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

    Future<ResponceModel> updateservice(
    String id,
    String service_name,
    String schedule_days,
    String schedule_time,
    String statuss,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updateservies}');
    final response = await http.post(url, body: {
      'id': id,
      'service_name': service_name,
      'schedule_days': schedule_days,
      'schedule_time': schedule_time,
      'status': statuss,
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

  Future<ResponceModel> selectservices(
    String id,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectservice}');
    final response = await http.post(url, body: {
      'id': id,
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
