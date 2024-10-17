import 'package:get/get.dart';
import 'package:patient_application/presentation/index/pages/index.dart';
import 'package:patient_application/presentation/login/pages/login.dart';

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
  ];
}
