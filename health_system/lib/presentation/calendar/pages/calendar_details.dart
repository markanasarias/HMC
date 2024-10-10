import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:get/get.dart';

void Calendar_details(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 640,
          height: 485,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 12),
                  child: Text(
                    'Calendar Details',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 381,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 190,
                                height: 80,
                                child: Center(
                                    child: Text('Name',
                                        style: TextStyles.AppBartext)),
                              ),
                              Container(
                                width: 270,
                                height: 80,
                                child: Center(
                                    child: Text('Date',
                                        style: TextStyles.AppBartext)),
                              ),
                              Container(
                                width: 118,
                                height: 80,
                                child: Center(
                                    child: Text('Action',
                                        style: TextStyles.AppBartext)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.medicalrecord.length,
                          itemBuilder: (context, index) {
                            final medicalrecord =
                                controller.medicalrecord[index];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 80,
                                    child: Center(
                                      child: Text(
                                          '${medicalrecord.medical_record}',
                                          style: TextStyles.AppBartext),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 80,
                                    child: Center(
                                      child: Text('${medicalrecord.file_name}',
                                          style: TextStyles.AppBartext),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 80,
                                    child: Center(
                                      child: Text(
                                          '${medicalrecord.created_date}',
                                          style: TextStyles.AppBartext),
                                    ),
                                  ),
                                  Container(
                                    width: 110,
                                    height: 80,
                                    child: Center(
                                      child: Text('${medicalrecord.status}',
                                          style: TextStyles.AppBartext),
                                    ),
                                  ),
                                  Container(
                                    width: 118,
                                    height: 80,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 20),
                                          IconButton(
                                            icon: Icon(Icons.visibility,
                                                color: Colors.blue),
                                            onPressed: () {
                                              // Open the base64 file when the visibility icon is pressed
                                              controller.openMedicalRecordFile(
                                                  medicalrecord.file,
                                                  medicalrecord.file_name);
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit,
                                                color: Colors.blue),
                                            onPressed: () {
                                              controller.openMedicalRecord(
                                                  medicalrecord.file,
                                                  medicalrecord.file_name);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text("Close"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text("Add Event"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
