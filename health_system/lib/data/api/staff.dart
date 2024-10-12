import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Staff {
  Future<ResponceModel> getstaff() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadstaff}');
    final response = await http.get(url);

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    // print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> getdoctor() async {
    final url = Uri.parse('${Config.apiUrl}${Config.getdoctor}');
    final response = await http.get(url);

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    // print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> selectstaff(String staffid) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectstaff}');
    final response = await http.post(url, body: {'staffid': staffid});

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> addstaff(
      String type,
      String fullname,
      String position,
      String specialization,
      String phone_number,
      String email,
      String address,
      String hire_date,
      String years_of_experience,
      String medical_license_number,
      String image,
      String createby,
      String center) async {
    final url = Uri.parse('${Config.apiUrl}${Config.addstaff}');
    final response = await http.post(url, body: {
      'type': type,
      'fullname': fullname,
      'position': position,
      'specialization': specialization,
      'phone_number': phone_number,
      'email': email,
      'address': address,
      'hire_date': hire_date,
      'years_of_experience': years_of_experience,
      'medical_license_number': medical_license_number,
      'image': image,
      'createby': createby,
      'center': center,
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

  Future<ResponceModel> updatestaff(
      String id,
      String type,
      String fullname,
      String position,
      String specialization,
      String phone_number,
      String email,
      String address,
      String hire_date,
      String years_of_experience,
      String medical_license_number,
      String image,
      String statuss,
      String center) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updatestaff}');
    final response = await http.post(url, body: {
      'id': id,
      'type': type,
      'fullname': fullname,
      'position': position,
      'specialization': specialization,
      'phone_number': phone_number,
      'email': email,
      'address': address,
      'hire_date': hire_date,
      'years_of_experience': years_of_experience,
      'medical_license_number': medical_license_number,
      'image': image,
      'status': statuss,
      'center': center,
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

  //Schedule
  Future<ResponceModel> loadschedule(String staffid) async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadsched}');
    final response = await http.post(url, body: {'staff_id': staffid});

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> selectschedule(String scheduleid) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectsched}');
    final response = await http.post(url, body: {'schedule_id': scheduleid});

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  Future<ResponceModel> addschedule(String staff_id, String work_date,
      String shift_time, String createby) async {
    final url = Uri.parse('${Config.apiUrl}${Config.savesched}');
    final response = await http.post(url, body: {
      'staff_id': staff_id,
      'work_date': work_date,
      'shift_time': shift_time,
      'createby': createby,
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

  Future<ResponceModel> updateschedule(
      String schedule_id,
      String work_date,
      String shift_time,
      String statuss,) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updatesched}');
    final response = await http.post(url, body: {
      'schedule_id': schedule_id,
      'work_date': work_date,
      'shift_time': shift_time,
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
