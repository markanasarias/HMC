import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patient_application/data/config/config.dart';
import 'package:patient_application/data/model/response.dart';

class BranchCenter {
  Future<ResponceModel> getcenter() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadcenter}');
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
}
