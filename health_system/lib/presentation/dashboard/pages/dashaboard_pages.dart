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
import 'package:health_system/data/model/dashboard_model.dart';

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
                                        controller.total_patients.value,
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
                                        controller.total_admin_staff.value,
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
                                        controller.total_doctors.value,
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
                                        controller.total_scheduled_appointments.value,
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
    child: Obx(
      () {
        if (controller.card.isEmpty) {
          return Center(
            child: Text('No Data Available'),
          );
        }
        
        final cardInfo = controller.card.first;

        List<PieData> pieDataList = [
          PieData(label: 'Total Patients', value: double.parse(cardInfo.total_patients)),
          PieData(label: 'Total Admin Staff', value: double.parse(cardInfo.total_admin_staff)),
          PieData(label: 'Total Doctors', value: double.parse(cardInfo.total_doctors)),
          PieData(label: 'Total Scheduled Appointments', value: double.parse(cardInfo.total_scheduled_appointments)),
        ];

        return Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: SfCircularChart(
            series: <CircularSeries>[
              PieSeries<PieData, String>(
                dataSource: pieDataList,
                xValueMapper: (PieData data, _) => data.label,
                yValueMapper: (PieData data, _) => data.value,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        );
      },
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
            if (controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.graph.isEmpty) {
              return Center(
                child: Text('No Data Available'),
              );
            }

            // Prepare the last 5 months data
            final currentDate = DateTime.now();
           List<MonthData> last5MonthsData = List.generate(5, (index) {
  final month = DateTime(currentDate.year, currentDate.month - index);
  final count = controller.graph
      .where((data) {
        final creationDate = controller.parseCreationMonth(data.creation_month);
        return creationDate != null && creationDate.month == month.month && creationDate.year == month.year;
      })
      .fold(0, (sum, data) => sum + int.parse(data.patient_count));
  
  return MonthData(
    "${month.month}/${month.year}",
    count,
  );
});


            return Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
                series: <SplineAreaSeries<MonthData, String>>[
                  SplineAreaSeries<MonthData, String>(
                    dataSource: last5MonthsData,
                    xValueMapper: (MonthData data, _) => data.name,
                    yValueMapper: (MonthData data, _) => data.count.toDouble(),
                    color: Colors.blue.withOpacity(0.3),
                    borderColor: Colors.blue,
                    borderWidth: 2,
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
