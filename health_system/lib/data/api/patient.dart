import 'dart:convert';
import 'dart:io';
import 'package:health_system/data/config/config.dart';
import 'package:health_system/data/model/response.dart';
import 'package:health_system/repository/helper.dart';
import 'package:http/http.dart' as http;

class Patient {
  Future<ResponceModel> getpatient() async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadpatient}');
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

    Future<ResponceModel> selectpatient(String patientid)async {
    final url = Uri.parse('${Config.apiUrl}${Config.selectpatient}');
    final response = await http.post(url, body: {
      'patientid': patientid
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

   Future<ResponceModel> addpatient(
    String first_name, String last_name, String middle_name,
    String age, String date_of_birth, String birth_place,
    String gender, String civil_status, String nationality,
    String religion, String occupation, String phone_number,
    String email, String address, String emergency_contact_name, 
    String emergency_contact_phone, String blood_type, String philhealth_number,
    String allergies, String createby,) async {
    final url = Uri.parse('${Config.apiUrl}${Config.addpatient}');
    final response = await http.post(url, body: {
      'first_name': first_name,
      'last_name': last_name,
      'middle_name': middle_name,
      'age': age,
      'date_of_birth': date_of_birth,
      'birth_place': birth_place,
      'gender': gender,
      'civil_status': civil_status,
      'nationality': nationality,
      'religion': religion,
      'occupation': occupation,
      'phone_number': phone_number,
      'email': email,
      'address': address,
      'emergency_contact_name': emergency_contact_name,
      'emergency_contact_phone': emergency_contact_phone,
      'blood_type': blood_type,
      'philhealth_number': philhealth_number,
      'allergies': allergies,
      'status': 'Active',
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

   Future<ResponceModel> updatepatient(String patient_id,
    String first_name, String last_name, String middle_name,String date_of_birth, String birth_place,
    String gender, String civil_status, String nationality,
    String religion, String occupation, String phone_number,
    String email, String address, String emergency_contact_name, 
    String emergency_contact_phone, String blood_type, String philhealth_number,
    String allergies, String statuss,) async {
    final url = Uri.parse('${Config.apiUrl}${Config.updatepatient}');
    final response = await http.post(url, body: {
      'patient_id': patient_id,
      'first_name': first_name,
      'last_name': last_name,
      'middle_name': middle_name,
      'date_of_birth': date_of_birth,
      'birth_place': birth_place,
      'gender': gender,
      'civil_status': civil_status,
      'nationality': nationality,
      'religion': religion,
      'occupation': occupation,
      'phone_number': phone_number,
      'email': email,
      'address': address,
      'emergency_contact_name': emergency_contact_name,
      'emergency_contact_phone': emergency_contact_phone,
      'blood_type': blood_type,
      'philhealth_number': philhealth_number,
      'allergies': allergies,
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

    Future<ResponceModel> addmedicalrecord(
    String patient_id, String medical_record,
    String file_name, String createby,) async {
    final url = Uri.parse('${Config.apiUrl}${Config.savemedicalrecord}');
    final response = await http.post(url, body: {
      'patient_id': patient_id,
      'medical_record': medical_record,
      'file': '',
      'file_name': file_name,
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

    Future<ResponceModel> getmedicalrecord(String patient_id) async {
    final url = Uri.parse('${Config.apiUrl}${Config.loadmedicalrecoard}');
    final response = await http.post(url, body: {
       'patient_id': patient_id,
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