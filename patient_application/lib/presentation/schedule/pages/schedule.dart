import 'package:flutter/material.dart';
import 'package:patient_application/app/Textstyles.dart';
import 'package:get/get.dart';
import 'package:patient_application/presentation/schedule/controllers/schedule_controllers.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScheduleControllers controller = Get.put(ScheduleControllers());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Monday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Monday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Mon',
                              style: controller.seletedday.value == 'Monday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Tuesday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Tuesday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Tue',
                              style: controller.seletedday.value == 'Tuesday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Wednesday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Wednesday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Wed',
                              style: controller.seletedday.value == 'Wednesday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Thursday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Thursday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Thu',
                              style: controller.seletedday.value == 'Thursday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Friday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Friday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Fri',
                              style: controller.seletedday.value == 'Friday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Saturday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Saturday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Sat',
                              style: controller.seletedday.value == 'Saturday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      controller.seletedday.value = 'Sunday';
                      controller.getsched();
                    },
                    child: Obx(() => Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            ),
                            color: controller.seletedday.value == 'Sunday'
                                ? Colors.blue
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Sun',
                              style: controller.seletedday.value == 'Sunday'
                                  ? TextStyles.Text1w
                                  : TextStyles.Text1,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Schedule list updated with Obx
          Expanded(
            child: Obx(() {
              if (controller.sched.isEmpty) {
                return Center(
                  child: Text(
                    'No schedule found!',
                    style: TextStyles.Text5,
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: controller.sched.length,
                  itemBuilder: (context, index) {
                    final scheds = controller.sched[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 11),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.medical_services_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 85.0, top: 18),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    scheds.fullname,
                                    style: TextStyles.Text5,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 85.0, top: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    scheds.shift_time,
                                    style: TextStyles.Text3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
