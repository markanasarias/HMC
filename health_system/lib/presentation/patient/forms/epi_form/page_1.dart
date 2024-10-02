import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/epi_form/page_2.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/epi_form/page_1.dart';
import 'package:health_system/presentation/patient/forms/phc_form/page_1_old.dart';

import 'package:health_system/widget/loading_form.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void EPIFORMPAGE1(BuildContext context) {
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
          height: 440,
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
                    'EPI FORM',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              //     SizedBox(
              //   height: 30,
              // ),
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
                        'Family Number',
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
                        left: 55,
                        right: 30,
                      ),
                      child: Text(
                        '4Ps',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 145,
                        right: 30,
                      ),
                      child: Text(
                        'NHTS',
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
                      width: 185,
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
                      width: 185,
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
                      width: 180,
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
                        'Name of Child:',
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
                        'Birthday:',
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
                      width: 280,
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
                      width: 280,
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
                        'Sex:',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 105,
                        right: 30,
                      ),
                      child: Text(
                        'Time of Delivery:',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 75,
                        right: 30,
                      ),
                      child: Text(
                        'Place of Delivery:',
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
                      width: 148,
                      height: 35,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Obx(() {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              items: controller.genders.map((String gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(
                                    gender,
                                    style: TextStyles.Text,
                                  ),
                                );
                              }).toList(),
                              value: controller.selectedGender.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedGender.value = newValue;
                                }
                              },
                              hint: Text(
                                'Select Gender',
                                style: TextStyles.Text,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 200,
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
                      width: 200,
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
                        'Name of Mother:',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 60,
                        right: 30,
                      ),
                      child: Text(
                        'Age',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 140,
                        right: 30,
                      ),
                      child: Text(
                        'Mother\'s Birthday',
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
                      width: 185,
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
                      width: 185,
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
                      width: 180,
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
                        'Father\'s Name',
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
                        left: 65,
                        right: 20,
                      ),
                      child: Text(
                        'Age',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 150,
                        right: 30,
                      ),
                      child: Text(
                        'Contact Number:',
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
                      width: 185,
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
                      width: 185,
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
                      width: 180,
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
              SizedBox(height: 15),
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
                      EPIFORMPAGE2(context);
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
