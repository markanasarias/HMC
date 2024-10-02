import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:health_system/presentation/appointment/pages/appointment_list_pages.dart';
import 'package:health_system/presentation/branch/pages/branch_list_pages.dart';
import 'package:health_system/presentation/calendar/pages/calendar_list_pages.dart';
import 'package:health_system/presentation/dashboard/pages/dashaboard_pages.dart';
import 'package:health_system/presentation/doctor/pages/doctor_list_pages.dart';
import 'package:health_system/presentation/index/controllers/index_controller.dart';
import 'package:health_system/presentation/inventory/pages/request/request_list_pages.dart';
import 'package:health_system/presentation/inventory/pages/stocks/invertory_list_pages.dart';
import 'package:health_system/presentation/logs/pages/logs_list_pages.dart';
import 'package:health_system/presentation/patient/pages/patient_list_pages.dart';
import 'package:health_system/presentation/services/pages/services_list_pages.dart';
import 'package:health_system/presentation/staff/pages/staff_list_pages.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IndexController controller = Get.put(IndexController());

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
                  selectedColor: Colors.lightBlue,
                  selectedTitleTextStyle: const TextStyle(color: Colors.white),
                  selectedIconColor: Colors.white,
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
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  SideMenuItem(
                    title: 'Patients',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.supervisor_account),
                  ),
                  SideMenuItem(
                    title: 'Doctor',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.person_2_outlined),
                  ),
                  SideMenuItem(
                    title: 'Staff',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.person_outline_outlined),
                  ),
                  SideMenuItem(
                    title: 'Branches',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.health_and_safety_outlined),
                  ),
                  SideMenuItem(
                    title: 'Appointment',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.person_outline_outlined),
                  ),
                  SideMenuItem(
                    title: 'Calendar',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.calendar_today_outlined),
                  ),
                    SideMenuExpansionItem(
    title: "Inventory",
    icon: const Icon(Icons.inventory_2_outlined),
    children: [
       SideMenuItem(
        title: 'Medicine & Equipment',
        onTap: (index, _) {
             controller.changePage(index);
        },
        icon: const Icon(Icons.medication_outlined),
      ),
      SideMenuItem(
        title: 'Stocks',
        onTap: (index, _) {
             controller.changePage(index);
        },
        icon: const Icon(Icons.medication_outlined),
      ),
      SideMenuItem(
        title: 'Request',
        onTap: (index, _) {
          controller.changePage(index);
        },
        icon: const Icon(Icons.medication_outlined),
      )
    ],
  ),
                  SideMenuItem(
                    title: 'Services',
                    onTap: (index, _) {
                      controller.changePage(index);
                    },
                    icon: const Icon(Icons.design_services_outlined),
                  ),
                  SideMenuItem(
                    title: 'Logs',
                    onTap: (index, _) {
                      controller.changePage(index);
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
                  children: [
                    DashboardPages(),
                    PatientListPages(),
                    DoctorListPages(),
                    StaffListPages(),
                    BranchListPages(),
                    AppointmentListPages(),
                    CalendarListPages(),
                    InvertoryListPages(),
                    RequestListPages(),
                    ServicesListPages(),
                    LogsListPages()
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
