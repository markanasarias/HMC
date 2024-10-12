import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Appointment {
  Future<ResponceModel> getappointment(
      String staff_id, String requestedby) async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadappointment}');
    final response = await http
        .post(url, body: {'staff_id': staff_id, 'requestedby': requestedby});

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> selectappointment(String appointment_id) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectappoinment}');
    final response =
        await http.post(url, body: {'appointment_id': appointment_id});

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> addappointment(
    String staff_id,
    String requestedby,
    String purpose,
    String startdate,
    String enddate,
    String created_by,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.addappoinment}');
    final response = await http.post(url, body: {
      'staff_id': staff_id,
      'requestedby': requestedby,
      'purpose': purpose,
      'startdate': startdate,
      'enddate': enddate,
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

  Future<ResponceModel> updateappointment(
    String appointment_id,
    String purpose,
    String startdate,
    String enddate,
    String statuss,
  ) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updateappoinment}');
    final response = await http.post(url, body: {
      'appointment_id': appointment_id,
      'purpose': purpose,
      'startdate': startdate,
      'enddate': enddate,
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
}
