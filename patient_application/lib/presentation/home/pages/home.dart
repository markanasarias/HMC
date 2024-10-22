import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:patient_application/app/Textstyles.dart';
import 'package:patient_application/presentation/home/controllers/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/app/Textstyles.dart';
import 'package:patient_application/presentation/medical_record/controllers/medical_record_controller.dart';
import 'package:patient_application/presentation/medical_record/pages/file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using GetX
import 'package:intl/intl.dart';
import 'dart:convert'; // For base64 decoding
import 'dart:io'; // For file operations
import 'package:path_provider/path_provider.dart'; // To get the temporary directory
import 'dart:typed_data';
import 'package:patient_application/presentation/medical_record/controllers/medical_record_controller.dart';
import 'package:patient_application/presentation/profile/controllers/profile_controllers.dart';
import 'package:patient_application/presentation/schedule/controllers/schedule_controllers.dart';

class Home extends StatelessWidget {
  final HomeControllers controller = Get.put(HomeControllers());
  final MedicalRecordController medicalRecordController =
      Get.put(MedicalRecordController());
  final ScheduleControllers schedulecontroller = Get.put(ScheduleControllers());

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/1.jpg',
      'assets/2.jpg',
      'assets/3.jpg',
    ];

    // Function to show image in a popup dialog
    void showImageDialog(BuildContext context, String imagePath) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Close"),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hey Good Day!', style: TextStyles.Text1),
                    Text('Mark Anasarias', style: TextStyles.Text3),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 20, top: 15),
              //   child: ClipOval(
              //     child: Image.asset(
              //       'assets/default_profile.jpg',
              //       width: 55.0,
              //       height: 55.0,
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 15),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                controller.updateIndex(index);
              },
            ),
            items: imgList
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      showImageDialog(context, item);
                    },
                    child: Container(
                      width: 1000,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          item,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          // SizedBox(height: 10),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.updateIndex(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                                controller.currentIndex.value == entry.key
                                    ? 0.9
                                    : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text('Doctor Today', style: TextStyles.AppBarHeader)),
          Expanded(
            child: Obx(() {
              final displayCount = schedulecontroller.sched.length < 2
                  ? schedulecontroller.sched.length
                  : 2;
              if (schedulecontroller.sched.isEmpty) {
                return Center(
                  child: Text(
                    'No records available',
                    style: TextStyles.Text1.copyWith(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: schedulecontroller.sched.length,
                itemBuilder: (context, index) {
                  final sched = schedulecontroller.sched[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 190,
                      height: 40,
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 170,
                            height: 110,
                            color: Colors.red,
                            child: Image.asset(
                              'assets/default_profile.jpg',
                              fit: BoxFit
                                  .fill, // Adjusts how the image fits within the container
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  sched.fullname,
                                  style: TextStyles.Text1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  sched.shift_time,
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
            }),
          ),

          Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text('Recent Record', style: TextStyles.AppBarHeader)),
          Expanded(
            child: Obx(() {
              final displayCount = medicalRecordController.record.length < 2
                  ? medicalRecordController.record.length
                  : 2;
              if (medicalRecordController.record.isEmpty) {
                return Center(
                  child: Text(
                    'No records available',
                    style: TextStyles.Text1.copyWith(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: medicalRecordController.record.length,
                itemBuilder: (context, index) {
                  final record = medicalRecordController.record[index];
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
                                  Icons.medical_information_outlined,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 85.0, top: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  record.medical_record,
                                  style: TextStyles.Text1,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 85.0, top: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  record.created_date,
                                  style: TextStyles.Text3,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 330.0, top: 28),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print(record.file_name);
                                    Get.to(() => FileRecord(
                                          fileName: record.file_name,
                                        ));
                                  },
                                  child: Icon(
                                    Icons.visibility,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
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
            }),
          ),
        ],
      ),
    );
  }
}
