import 'package:get/get.dart';
import 'package:health_system/presentation/index/pages/index_pages.dart';
import 'package:health_system/presentation/login/pages/login.dart';
import 'package:health_system/presentation/patient/controllers/patient_bindings.dart';
import 'package:health_system/presentation/patient/pages/patient_list_pages.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => Login(),
    ),
    GetPage(
      name: '/index',
      page: () => Index(),
    ),
    GetPage(
        name: '/patient',
        page: () => PatientListPages(),
        binding: PatientBindings()),
  ];
}
