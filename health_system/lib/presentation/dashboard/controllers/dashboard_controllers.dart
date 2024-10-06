import 'package:get/get.dart';
import 'package:health_system/data/model/userinfo.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:health_system/repository/helper.dart';

class DashboardController extends GetxController {
  var loading = true.obs; 
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
  RxList<PatientData> patientData =
      <PatientData>[].obs; // Observable list of PatientData

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
    fetchPatientData();
    _getUserInfo();
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

  Future<void> fetchPatientData() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 1));
    try {
      patientData.value = [
        PatientData(
            '001', 'John Doe', '123-456-7890', 'Consultation', DateTime.now()),
        PatientData('002', 'Jane Smith', '987-654-3210', 'Routine Checkup',
            DateTime.now()),
        PatientData('003', 'Alice Johnson', '555-123-4567', 'Emergency',
            DateTime.now()),
        PatientData(
            '004', 'Bob Brown', '555-987-6543', 'Follow-up', DateTime.now()),
      ];
    } catch (error) {
      print('Error fetching patient data: $error');
    } finally {
      loading.value = false;
    }
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
