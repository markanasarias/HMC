import 'package:get/get.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';

class PatientBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientControllers>(() => PatientControllers());
  }
}
