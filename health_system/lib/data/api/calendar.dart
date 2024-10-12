import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Calendar {
  Future<ResponceModel> getcalendar() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadevent}');
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

  Future<ResponceModel> selectevent(String id) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectevent}');
    final response = await http.post(url, body: {'id': id});

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> getevents(
    String date,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.getevents}');
    final response = await http.post(url, body: {
      'date': date,
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

  Future<ResponceModel> savecalendar(
    String name,
    String descriptions,
    String start_time,
    String end_time,
    String location,
    String createby,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.savecalendar}');
    final response = await http.post(url, body: {
      'name': name,
      'description': descriptions,
      'start_time': start_time,
      'end_time': end_time,
      'location': location,
      'createby': createby,
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

  Future<ResponceModel> updatecalendar(
    String id,
    String name,
    String descriptions,
    String start_time,
    String end_time,
    String location,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updateevent}');
    final response = await http.post(url, body: {
      'id': id,
      'name': name,
      'description': descriptions,
      'start_time': start_time,
      'end_time': end_time,
      'location': location,
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
