import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/tb_form/tb_form.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:health_system/presentation/patient/forms/phc_form/page_2.dart';

void PHCPage1(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 600,
          height: 460,
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
                    'PHC FORM',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 30,
                      ),
                      child: Text(
                        'FN',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 155,
                        right: 30,
                      ),
                      child: Text(
                        'Chief Complaint',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 360,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    'S',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              SizedBox(
                width: 570,
                height: 65,
                child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  style: TextStyles.Text,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF1F6),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  maxLines: 3,
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 30,
                      ),
                      child: Text(
                        'BP',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 85,
                        right: 30,
                      ),
                      child: Text(
                        'HR',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 82,
                        right: 30,
                      ),
                      child: Text(
                        'RR',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 113,
                        right: 30,
                      ),
                      child: Text(
                        'Temp',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 30,
                      ),
                      child: Text(
                        'O2sat',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 62,
                        right: 30,
                      ),
                      child: Text(
                        'HT',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 83,
                        right: 30,
                      ),
                      child: Text(
                        'WT',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 110,
                        right: 30,
                      ),
                      child: Text(
                        'WLINE',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        style: TextStyles.Text1,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 30,
                      ),
                      child: Text(
                        'SKIN',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 340,
                        right: 30,
                      ),
                      child: Text(
                        'OTHERS',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Pallor"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Rashes"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Jaundice"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Good skin turgor"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 170,
                    height: 33,
                    child: CupertinoTextField(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      style: TextStyles.Text,
                      decoration: BoxDecoration(
                        color: Color(0xFFEFF1F6),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("Next"),
                    onPressed: () {
                      PHCPage2(context);
                      //Get.back();
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
