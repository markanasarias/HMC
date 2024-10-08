import 'package:get/get.dart';
import 'package:health_system/data/api/dashboard.dart';
import 'package:health_system/data/model/dashboard_model.dart';
import 'package:health_system/data/model/userinfo.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:health_system/repository/helper.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:health_system/data/api/calendar.dart';
import 'package:health_system/data/api/center.dart';
import 'package:health_system/data/api/logs.dart';
import 'package:health_system/data/model/calendar_model.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/data/model/logs_model.dart';
import 'package:health_system/repository/helper.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  var loading = true.obs; 
  var total_patients = ''.obs;
  var total_admin_staff = ''.obs;
  var total_doctors = ''.obs;
  var total_scheduled_appointments= ''.obs;
  var id = ''.obs;
  var type = ''.obs;
  var fullname = ''.obs;
  var role = ''.obs;
  var position = ''.obs;
  var specialization = ''.obs;
  var phone_number = ''.obs;
  var email = ''.obs;
  var address = ''.obs;
  var hire_date = ''.obs;
  var years_of_experience = ''.obs;
  var medical_license_number = ''.obs;
  var image = ''.obs;
  var createby = ''.obs;
  var createddate = ''.obs;
  var accesstypeid = ''.obs;
  var status = ''.obs;
  var usertype = ''.obs;


  Helper helper = Helper();

  var card = <CardModel>[].obs;
  var graph = <GraphModel>[].obs;
  
  RxList<PatientData> patientData =
      <PatientData>[].obs; 

  // Columns for PlutoGrid
  List<PlutoColumn> get columns => [
        PlutoColumn(
          title: 'Patient ID',
          field: 'patiendid',
          type: PlutoColumnType.text(),
          width: 150,
        ),
        PlutoColumn(
          title: 'Name',
          field: 'name',
          type: PlutoColumnType.text(),
          width: 150,
        ),
        PlutoColumn(
          title: 'Phone Number',
          field: 'phonenumber',
          type: PlutoColumnType.text(),
          width: 150,
        ),
        PlutoColumn(
          title: 'Services',
          field: 'services',
          type: PlutoColumnType.text(),
          width: 150,
        ),
      ];

  // Rows for PlutoGrid
  List<PlutoRow> get rows => patientData.map((data) {
        return PlutoRow(
          cells: {
            'patiendid': PlutoCell(value: data.patiendid),
            'name': PlutoCell(value: data.name),
            'phonenumber': PlutoCell(value: data.phonenumber),
            'services': PlutoCell(value: data.services),
          },
        );
      }).toList();

  @override
  void onInit() {
    super.onInit();
    _getUserInfo();
    getloadcard();
    getloadgraph();
  }

    Future<void> getloadcard() async {
    print('getloadcenter');
    loading.value = true;
    try {
      final response = await Dashboard().getcount();

      if (helper.getStatusString(APIStatus.success) == response.message) {
    loading.value = false;
        final jsondata = json.encode(response.result);
      

        for (var cardcount in json.decode(jsondata)) {
          CardModel cardinfo = CardModel(
            cardcount['total_patients'].toString(),
            cardcount['total_admin_staff'].toString(),
            cardcount['total_doctors'].toString(),
            cardcount['total_scheduled_appointments'].toString(),
           
          );
          card.add(cardinfo);
          total_patients.value = cardinfo.total_patients;
          total_admin_staff.value = cardinfo.total_admin_staff;
          total_doctors.value = cardinfo.total_doctors;
          total_scheduled_appointments.value = cardinfo.total_scheduled_appointments;
        }
      } else {
        print('Error: ${response.message}');
      }
    } catch (e) {
      print('An error occurred while loading patient data: $e');
    }
  }

Future<void> getloadgraph() async {
  loading.value = true;
  try {
    final response = await Dashboard().getgraph();

    if (helper.getStatusString(APIStatus.success) == response.message) {
      loading.value = false;
      final jsondata = json.encode(response.result);

      graph.clear(); // Clear previous data
      for (var graphinfos in json.decode(jsondata)) {
        // Use the factory constructor to create GraphModel instances
        GraphModel graphinfo = GraphModel.fromJson(graphinfos);
        graph.add(graphinfo);
      }
    } else {
      print('Error: ${response.message}');
    }
  } catch (e) {
    print('An error occurred while loading patient data: $e');
  }
}

DateTime? parseCreationMonth(String creationMonth) {
  try {
    final currentYear = DateTime.now().year; // Get the current year
    return DateFormat('MMMM').parse(creationMonth).copyWith(year: currentYear);
  } catch (e) {
    print("Error parsing date: $e");
    return null; // Handle as needed
  }
}




    Future<void> _getUserInfo() async {
    Map<String, dynamic> userinfo =
      await Helper().readJsonToFile('metadata.json');
    UserInfoModel user = UserInfoModel(
      userinfo['id'].toString(),
      userinfo['type'],
      userinfo['fullname'],
      userinfo['position'],
      userinfo['specialization'],
      userinfo['phone_number'],
      userinfo['email'],
      userinfo['address'],
      userinfo['hire_date'],
      userinfo['years_of_experience'].toString(),
      userinfo['medical_license_number'],
      userinfo['image'],
      userinfo['createby'],
      userinfo['createddate'],
      userinfo['status'],
      userinfo['center'],
      userinfo['usertype'],
    );

  image.value = user.image;
  id.value = user.id;
  type.value = user.type.toString();
   fullname.value = user.fullname.toString();
   position.value = user.position.toString();
   specialization.value = user.specialization.toString();
   phone_number.value = user.phone_number.toString();
   email.value = user.email.toString();
   address.value = user.address.toString();
   hire_date.value = user.hire_date.toString();
   years_of_experience.value = user.years_of_experience.toString();
   medical_license_number.value = user.medical_license_number.toString();
createby.value = user.createby.toString();
createddate.value = user.createddate.toString();
status.value = user.status.toString();
usertype.value = user.usertype.toString();
print('name: $fullname');
print('usertype: $usertype');
  }

}

class PatientData {
  PatientData(
      this.patiendid, this.name, this.phonenumber, this.services, this.date);

  final String patiendid;
  final String name;
  final String phonenumber;
  final String services;
  DateTime date;
}

class MonthData {
  MonthData(this.name, this.count);
  final String name;
  final int count;
}
