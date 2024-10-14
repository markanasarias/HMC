import 'package:get/get.dart';
import 'package:patient_application/presentation/login/pages/login.dart';

class Routes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => Login(),
    ),
  ];
}
