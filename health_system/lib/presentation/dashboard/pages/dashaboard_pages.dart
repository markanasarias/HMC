import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:health_system/presentation/dashboard/controllers/dashboard_controllers.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';

class DashboardPages extends StatelessWidget {
  const DashboardPages({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Patient',
                                  style: TextStyles.Header,
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
                              size: 80,
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
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Patient',
                                  style: TextStyles.Header,
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
                              size: 80,
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
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Patient',
                                  style: TextStyles.Header,
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
                              size: 80,
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
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Patient',
                                  style: TextStyles.Header,
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
                              size: 80,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(
                      () {
                        if (controller.patientData.isEmpty) {
                          return Center(
                            child: Text('No Data Available'),
                          );
                        }
                        return Container(
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: SfCircularChart(
                            series: <CircularSeries>[
                              PieSeries<PatientData, String>(
                                dataSource: controller.patientData,
                                xValueMapper: (PatientData data, _) =>
                                    data.name,
                                yValueMapper: (PatientData data, _) => data
                                    .patiendid.length
                                    .toDouble(), // Just for example
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Obx(
                      () {
                        if (controller.patientData.isEmpty) {
                          return Center(
                            child: Text('No Data Available'),
                          );
                        }
                        return Container(
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: PlutoGrid(
                            columns: controller.columns,
                            rows: controller.rows,
                            onChanged: (PlutoGridOnChangedEvent event) {},
                            configuration: PlutoGridConfiguration(
                              style: PlutoGridStyleConfig(
                                borderColor: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
