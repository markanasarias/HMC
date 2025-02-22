// index.dart

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

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IndexController controller = Get.put(IndexController());
    final DashboardController controllers = Get.put(DashboardController());

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => SideMenu(
                controller: controller.sideMenuController.value,
                style: SideMenuStyle(
                  displayMode: SideMenuDisplayMode.auto,
                  showHamburger: false,
                  hoverColor: Colors.blue[100],
                  selectedHoverColor: Colors.blue[100],
                  selectedColor: Colors.white,
                  selectedTitleTextStyle: const TextStyle(color: Colors.black54),
                  selectedIconColor: Colors.black54,
                  openSideMenuWidth: 220,
                  compactSideMenuWidth: 80,
                ),
                title: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 85,
                        maxWidth: 85,
                      ),
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                  ],
                ),
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(12)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    ),
                  ),
                ),
                items: [
                  SideMenuItem(
                    title: 'Dashboard',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.dashboard);
                      print(controllers.usertype.value);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  SideMenuItem(
                    title: 'Patients',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.patients);
                    },
                    icon: const Icon(Icons.supervisor_account),
                  ),
                  SideMenuItem(
                    title: 'Staff',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.staff);
                    },
                    icon: const Icon(Icons.person_outline_outlined),
                  ),
                  SideMenuItem(
                    title: 'Center',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.center);
                    },
                    icon: const Icon(Icons.health_and_safety_outlined),
                  ),
                  SideMenuExpansionItem(
                    title: "Inventory",
                    icon: const Icon(Icons.inventory_2_outlined),
                    children: [
                      if (controllers.usertype.value == 'Admin')
                        SideMenuItem(
                          title: 'Items',
                          onTap: (_, __) {
                            controller.changePage(PageEnum.inventory);
                          },
                          icon: const Icon(Icons.medication_outlined),
                        ),
                      SideMenuItem(
                        title: 'Stocks',
                        onTap: (_, __) {
                          controller.changePage(PageEnum.stocks);
                        },
                        icon: const Icon(Icons.medication_outlined),
                      ),
                      if (controllers.usertype.value == 'Admin')
                        SideMenuItem(
                          title: 'Center Request',
                          onTap: (_, __) {
                            controller.changePage(PageEnum.centerrequest);
                          },
                          icon: const Icon(Icons.medication_outlined),
                        ),
                      if (controllers.usertype.value == 'Doctor')
                        SideMenuItem(
                          title: 'Request',
                          onTap: (_, __) {
                            controller.changePage(PageEnum.Request);
                          },
                          icon: const Icon(Icons.medication_outlined),
                        ),
                    ],
                  ),
                  SideMenuItem(
                    title: 'Appointment',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.appointment);
                    },
                    icon: const Icon(Icons.person_outline_outlined),
                  ),
                  SideMenuItem(
                    title: 'Calendar',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.calendar);

                      print(controller.sideMenuController.value);
                    },
                    icon: const Icon(Icons.calendar_today_outlined),
                  ),
                  SideMenuItem(
                    title: 'Services',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.services);
                    },
                    icon: const Icon(Icons.design_services_outlined),
                  ),
                  SideMenuItem(
                    title: 'Logs',
                    onTap: (_, __) {
                      controller.changePage(PageEnum.logs);
                    },
                    icon: const Icon(Icons.list_alt_outlined),
                  ),
                ],
              )),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: Obx(() => PageView(
                  controller: controller.pageController.value,
                  children: controller.pages.values.toList(),
                )),
          ),
        ],
      ),
    );
  }
}
