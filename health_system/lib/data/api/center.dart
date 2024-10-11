import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class BranchCenter {
  Future<ResponceModel> getcenter() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadcenter}');
    final response = await http.get(url);

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    //print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

    Future<ResponceModel> selectcenter(String branch_id) async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectcenter}');
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
    Future<ResponceModel> addcenter(String Name, String Location, String createdby) async {
    final url = Uri.parse('${Config.apiUrl}${Config.addcenter}');
    final response = await http.post(url, body: {
      'branch_name': Name,
      'address': Location,
      'createdby': createdby,
    });

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    //print(message);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }
    Future<ResponceModel> updatecenter(String branch_id, String Name, String Location, String statuss) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updatecenter}');
    final response = await http.post(url, body: {
      'branch_id': branch_id,
      'branch_name': Name,
      'address': Location,
      'status': statuss,
    });

    final responseData = json.decode(response.body);
    final status = response.statusCode;
    final message = responseData['msg'];
    final result = responseData['data'] ?? [];
    final description = responseData['description'] ?? "";

    //print(message);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }
}