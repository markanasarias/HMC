import 'package:get/get.dart';
import 'package:health_system/presentation/index/pages/index_pages.dart';
import 'package:health_system/presentation/login/pages/login.dart';

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
