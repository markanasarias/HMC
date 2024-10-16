import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dotted_border/dotted_border.dart';

void AddMedicalRecord(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 425,
          height: 290,
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
                    'Add Medical Record',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'Name',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 385,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.medical_record,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'File Attactment',
                    style: TextStyles.Text,
                  ),
                ),
              ),
  Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Obx(
                    () => controller.selectedFileName.value != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF1F6),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.1),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DottedBorder(
                                color: Colors.grey,
                                dashPattern: [6, 3],
                                strokeWidth: 1.0,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(5),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 64,
                                        height: 80,
                                        child: Icon(Icons.file_upload_outlined),
                                      ),
                                      // Expanded(
                                      //   child: Padding(
                                      //     padding: EdgeInsets.only(top: 10),
                                      //     child: Text(
                                      //       controller.selectedFileName.value!,
                                      //       style: TextStyles.Text1,
                                      //       overflow: TextOverflow.ellipsis,
                                      //     ),
                                      //   ),
                                      // ),
                                      Expanded(
                                        child: Text(
                                          controller.selectedFileName.value!,
                                          style: TextStyles.Text1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      Container(
                                        width: 70,
                                        height: 80,
                                        child: GestureDetector(
                                          onTap: controller.removeSelectedFile,
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: controller.openFileExplorer,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFEFF1F6),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.1),
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DottedBorder(
                                  color: Colors.grey,
                                  dashPattern: [6, 3],
                                  strokeWidth: 1.0,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(5),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Icon(Icons.file_upload_outlined),
                                      SizedBox(width: 20),
                                      Center(
                                        child: Text(
                                          'Upload File',
                                          style: TextStyles.Text1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              SizedBox(height: 10),
              Divider(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text("Save"),
                      onPressed: () {
                        controller.addmedicalrecord(context);
                        //showSuccessToast(context);
                        //Navigator.of(context).pop();
                      },
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
