// main_app_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:latlong2/latlong.dart';
import 'package:patient_application/data/api/center.dart';
import 'package:patient_application/data/model/center_model.dart';
import 'package:patient_application/data/model/user_model.dart';
import 'package:patient_application/repository/repository.dart';
import 'package:intl/intl.dart';

class ProfileControllers extends GetxController {
  Helper helper = Helper();

  final TextEditingController patient_id = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController middleName = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController birthPlace = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController civilStatus = TextEditingController();
  final TextEditingController nationality = TextEditingController();
  final TextEditingController religion = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController emergencyContactName = TextEditingController();
  final TextEditingController emergencyContactPhone = TextEditingController();
  final TextEditingController bloodType = TextEditingController();
  final TextEditingController philhealthNumber = TextEditingController();
  final TextEditingController allergies = TextEditingController();
  final TextEditingController createdBy = TextEditingController();
  final TextEditingController createdDate = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    try {
      Map<String, dynamic> userinfo =
          await Helper().readJsonToFile('metadata.json');

      PatientModel user = PatientModel(
        userinfo['patient_id']?.toString() ??
            '', // handle potential null values
        userinfo['first_name'] ?? '',
        userinfo['last_name'] ?? '',
        userinfo['middle_name'] ?? '',
        userinfo['age']?.toString() ?? '',
        userinfo['date_of_birth'] ?? '',
        userinfo['birth_place'] ?? '',
        userinfo['gender'] ?? '',
        userinfo['civil_status'] ?? '',
        userinfo['nationality'] ?? '',
        userinfo['religion'] ?? '',
        userinfo['occupation'] ?? '',
        userinfo['phone_number'] ?? '',
        userinfo['email'] ?? '',
        userinfo['address'] ?? '',
        userinfo['emergency_contact_name'] ?? '',
        userinfo['emergency_contact_phone'] ?? '',
        userinfo['blood_type'] ?? '',
        userinfo['philhealth_number'] ?? '',
        userinfo['allergies'] ?? '',
        userinfo['status'] ?? '',
        userinfo['createdBy'] ?? '',
        userinfo['createdDate'] ?? '',
      );

      String formattedDate = '';
      if (user.date_of_birth.isNotEmpty) {
        try {
          DateTime parsedDate = DateTime.parse(user.date_of_birth);
          formattedDate = DateFormat('MMMM d, y')
              .format(parsedDate); // October 17, 2024 format
        } catch (e) {
          print('Error parsing dateOfBirth: $e');
        }
      }

      patient_id.text = user.patient_id;
      firstName.text =
          user.first_name + ' ' + user.middle_name + ' ' + user.last_name;
      lastName.text = user.middle_name;
      middleName.text = user.last_name;
      age.text = user.age;
      dateOfBirth.text = formattedDate;
      birthPlace.text = user.birth_place;
      gender.text = user.gender;
      civilStatus.text = user.civil_status;
      nationality.text = user.nationality;
      religion.text = user.religion;
      occupation.text = user.occupation;
      phoneNumber.text = user.phone_number;
      email.text = user.email;
      address.text = user.address;
      emergencyContactName.text = user.emergency_contact_name;
      emergencyContactPhone.text = user.emergency_contact_phone;
      bloodType.text = user.blood_type;
      philhealthNumber.text = user.philhealth_number;
      allergies.text = user.allergies;
      createdBy.text = user.createdBy;
      createdDate.text = user.createdDate;
    } catch (e) {
      print("Error: $e");
    }
  }
}
