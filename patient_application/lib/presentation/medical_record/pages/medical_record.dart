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


class MedicalRecords extends StatelessWidget {
  final MedicalRecordController controller = Get.put(MedicalRecordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.record.length, // Reactive list length
                itemBuilder: (context, index) {
                  final record = controller.record[index];
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
                                    Get.to(() => FileRecord(fileName: record.file_name,));
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
