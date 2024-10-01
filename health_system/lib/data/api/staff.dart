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

    print(result);

    ResponceModel data = ResponceModel(message, status, result, description);
    return data;
  }

  // Future<ResponceModel> request(
  //     String employeeid, String amount, String purpose) async {
  //   Map<String, dynamic> serverinfo = {};

  //   if (Platform.isWindows) {
  //     serverinfo = await Helper().readJsonToFile('server.json');
  //   }
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     serverinfo = await Helper().JsonToFileRead('server.json');
  //   }

  //   String host = serverinfo['domain'];
  //   final url = Uri.parse('$host${Config.requestashAPI}');
  //   final response = await http.post(url, body: {
  //     'employeeid': employeeid,
  //     'amount': amount,
  //     'purpose': purpose,
  //   });

  //   final responseData = json.decode(response.body);
  //   final status = response.statusCode;
  //   final message = responseData['msg'];
  //   final result = responseData['data'] ?? [];
  //   final description = responseData['description'] ?? "";
  //   print('result: $result');
  //   ResponceModel data = ResponceModel(message, status, result, description);
  //   return data;
  // }

  // Future<ResponceModel> cancelrequest(
  //     String employeeid, String caCashadvanceid, String caStatus) async {
  //   Map<String, dynamic> serverinfo = {};

  //   if (Platform.isWindows) {
  //     serverinfo = await Helper().readJsonToFile('server.json');
  //   }
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     serverinfo = await Helper().JsonToFileRead('server.json');
  //   }

  //   String host = serverinfo['domain'];
  //   final url = Uri.parse('$host${Config.updatecashAPI}');
  //   final response = await http.post(url, body: {
  //     'employeeid': employeeid,
  //     'cashadvanceid': caCashadvanceid,
  //     'status': caStatus,
  //   });

  //   final responseData = json.decode(response.body);
  //   final status = response.statusCode;
  //   final message = responseData['msg'];
  //   final result = responseData['data'] ?? [];
  //   final description = responseData['description'] ?? "";
  //   print('result: $result');
  //   ResponceModel data = ResponceModel(message, status, result, description);
  //   return data;
  // }
}