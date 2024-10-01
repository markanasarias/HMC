import 'package:flutter/material.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:health_system/widget/loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:health_system/presentation/dashboard/controllers/dashboard_controllers.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';

class DashboardPages extends StatelessWidget {
  const DashboardPages({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
        body: Obx(
      () => Container(
        color: Colors.grey.withOpacity(0.1),
        child: controller.loading.value
            ? Loading()
            : Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    AdminAppbar(title: 'Dashboard'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Patient',
                                        style: TextStyles.AppBarHeader,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '100',
                                        style: TextStyles.Text5,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.supervisor_account,
                                    size: 60,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Staff',
                                        style: TextStyles.AppBarHeader,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '100',
                                        style: TextStyles.Text5,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.supervisor_account,
                                    size: 60,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Doctor',
                                        style: TextStyles.AppBarHeader,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '100',
                                        style: TextStyles.Text5,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.supervisor_account,
                                    size: 60,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Appointment',
                                        style: TextStyles.AppBarHeader,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '100',
                                        style: TextStyles.Text5,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.supervisor_account,
                                    size: 60,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 370,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Expanded(
                              child: Obx(
                                () {
                                  if (controller.patientData.isEmpty) {
                                    return Center(
                                      child: Text('No Data Available'),
                                    );
                                  }
                                  return Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: SfCircularChart(
                                      series: <CircularSeries>[
                                        PieSeries<PatientData, String>(
                                          dataSource: controller.patientData,
                                          xValueMapper: (PatientData data, _) =>
                                              data.name,
                                          yValueMapper: (PatientData data, _) =>
                                              data.patiendid.length
                                                  .toDouble(), // Just for example
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                       Expanded(
  child: Container(
    height: 370,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Obx(
      () {
        if (controller.patientData.isEmpty) {
          return Center(
            child: Text('No Data Available'),
          );
        }
        return Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            series: <LineSeries<dynamic, String>>[
              LineSeries<PatientData, String>(
                dataSource: controller.patientData,
                xValueMapper: (PatientData data, _) => data.name,
                yValueMapper: (PatientData data, _) =>
                    data.patiendid.length.toDouble(),
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        );
      },
    ),
  ),
)                      
                      ],
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
