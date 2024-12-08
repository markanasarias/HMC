// index_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:health_system/presentation/appointment/pages/appointment_list_pages.dart';
import 'package:health_system/presentation/center/pages/branch_list_pages.dart';
import 'package:health_system/presentation/calendar/pages/calendar_list_pages.dart';
import 'package:health_system/presentation/dashboard/controllers/dashboard_controllers.dart';
import 'package:health_system/presentation/dashboard/pages/dashaboard_pages.dart';
import 'package:health_system/presentation/index/controllers/index_controller.dart';
import 'package:health_system/presentation/inventory/pages/items/items.dart';
import 'package:health_system/presentation/inventory/pages/request_admin/request_list_pages.dart';
import 'package:health_system/presentation/inventory/pages/request_staff/request_list_pages.dart';
import 'package:health_system/presentation/inventory/pages/stocks/invertory_list_pages.dart';
import 'package:health_system/presentation/logs/pages/logs_list_pages.dart';
import 'package:health_system/presentation/patient/pages/patient_list_pages.dart';
import 'package:health_system/presentation/services/pages/services_list_pages.dart';
import 'package:health_system/presentation/staff/pages/staff_list_pages.dart';

// Enum to represent different pages
enum PageEnum {
  dashboard,
  patients,
  staff,
  center,
  inventory,
  stocks,
  centerrequest,
  Request,
  appointment,
  calendar,
  services,
  logs,
}

class IndexController extends GetxController {
  var pageController = PageController().obs;
  var page = Rx<dynamic>(1);
  var sideMenuController = SideMenuController().obs;
  var selectedPage = PageEnum.dashboard.obs;
  final Map<PageEnum, Widget> pages = {
    PageEnum.dashboard: DashboardPages(),
    PageEnum.patients: PatientListPages(),
    PageEnum.staff: StaffListPages(),
    PageEnum.center: BranchListPages(),
    PageEnum.inventory: ItemsListPages(),
    PageEnum.stocks: InvertoryListPages(),
    PageEnum.centerrequest: RequestListPages(),
    PageEnum.Request: RequestStaffListPages(),
    PageEnum.appointment: AppointmentListPages(),
    PageEnum.calendar: CalendarListPages(),
    PageEnum.services: ServicesListPages(),
    PageEnum.logs: LogsListPages(),
  };

  @override
  void onInit() {
    sideMenuController.value.addListener((index) {
      print(index);
      pageController.value.jumpToPage(index);
    });
    super.onInit();
  }

  void changePage(PageEnum page) {
    final pageIndex = pages.keys.toList().indexOf(page);
    sideMenuController.value.changePage(pageIndex);
    selectedPage.value = page;
    pageController.value.jumpToPage(PageEnum.values.indexOf(page));
  }
}