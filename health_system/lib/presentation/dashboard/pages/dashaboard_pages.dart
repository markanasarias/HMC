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
                                final currentDate = DateTime.now();
                                List<MonthData> last5MonthsData =
                                    List.generate(5, (index) {
                                  final month = DateTime(currentDate.year,
                                      currentDate.month - index);
                                  final count = controller.patientData
                                      .where((data) =>
                                          data.date.month == month.month &&
                                          data.date.year == month.year)
                                      .length;

                                  return MonthData(
                                    "${month.month}/${month.year}",
                                    count,
                                  );
                                });

                                if (last5MonthsData.isEmpty) {
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
                                  child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    primaryYAxis: NumericAxis(),
                                    series: <SplineAreaSeries<MonthData,
                                        String>>[
                                      SplineAreaSeries<MonthData, String>(
                                        dataSource: last5MonthsData,
                                        xValueMapper: (MonthData data, _) =>
                                            data.name,
                                        yValueMapper: (MonthData data, _) =>
                                            data.count.toDouble(),
                                        color: Colors.blue.withOpacity(0.3),
                                        borderColor: Colors.blue,
                                        borderWidth: 2,
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
                      ],
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
