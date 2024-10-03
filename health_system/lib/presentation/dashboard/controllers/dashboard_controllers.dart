import 'package:get/get.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';

class DashboardController extends GetxController {
  var loading = true.obs; // Observable loading state
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
