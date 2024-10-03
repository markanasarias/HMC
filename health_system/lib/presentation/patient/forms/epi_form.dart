import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void EPIFORM(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 800,
          height: 1000,
          child: Column(
            children: <Widget>[
              // Fixed header
              Container(
                width: double.infinity,
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

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        //content
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                        items: controller.genders
                                            .map((String gender) {
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
                                            controller.selectedGender.value =
                                                newValue;
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  'Mode of Delivery',
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
                                  left: 50,
                                  right: 30,
                                ),
                                child: Text(
                                  'Birth Weight',
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
                                  'Birth length',
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  'Head Circumference',
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
                                  left: 20,
                                  right: 30,
                                ),
                                child: Text(
                                  'Chest Circumference',
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
                                  left: 10.95,
                                  right: 30,
                                ),
                                child: Text(
                                  'Abdomen Circumference',
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  right: 10,
                                ),
                                child: Text(
                                  'Newbornm Screening:(Y/N) Date done:',
                                  style: TextStyles.Text,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  left: 25,
                                  right: 30,
                                ),
                                child: Text(
                                  'Vitamin K: Date Given',
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  'Newborn Heart Test:(Y/N) Date done:',
                                  style: TextStyles.Text,
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
                                  'Type of Feeding:',
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Radio 1
                                  Column(
                                    children: [
                                      Obx(() => Radio<int>(
                                            value: 1,
                                            groupValue:
                                                controller.selectedOption.value,
                                            onChanged: (int? value) {
                                              controller.selectedOption.value =
                                                  value!;
                                            },
                                          )),
                                      Text("EBF"),
                                    ],
                                  ),
                                  // Radio 2
                                  Column(
                                    children: [
                                      Obx(() => Radio<int>(
                                            value: 2,
                                            groupValue:
                                                controller.selectedOption.value,
                                            onChanged: (int? value) {
                                              controller.selectedOption.value =
                                                  value!;
                                            },
                                          )),
                                      Text("BO"),
                                    ],
                                  ),
                                  // Radio 3
                                  Column(
                                    children: [
                                      Obx(() => Radio<int>(
                                            value: 3,
                                            groupValue:
                                                controller.selectedOption.value,
                                            onChanged: (int? value) {
                                              controller.selectedOption.value =
                                                  value!;
                                            },
                                          )),
                                      Text("MF"),
                                    ],
                                  ),
                                  // Radio 4
                                  Column(
                                    children: [
                                      Obx(() => Radio<int>(
                                            value: 4,
                                            groupValue:
                                                controller.selectedOption.value,
                                            onChanged: (int? value) {
                                              controller.selectedOption.value =
                                                  value!;
                                            },
                                          )),
                                      Text("CF"),
                                    ],
                                  ),
                                ],
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
                                  'EPI Number',
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
                                  left: 175,
                                  right: 30,
                                ),
                                child: Text(
                                  'UFC Number',
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 277.5,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'ANTIGEN',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'BCG',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Hepa B1 at birth',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Hepa B1>24hrs',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'PentalHib',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'OPV',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'PCV',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'IPV',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'MMR1',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Vitamin A',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'MMR2',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '2',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '3',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '9 mos.',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, right: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1y.o',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                                  'OTHER VACCINES GIVEN',
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
                                  left: 320,
                                  right: 30,
                                ),
                                child: Text(
                                  'REMARKS',
                                  style: TextStyles.Text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'ANTIGEN',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'BCG',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Hepa B1 at birth',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Hepa B1>24hrs',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '1',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '2',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '3',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'ANTIGEN',
                                            style: TextStyles.Text,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 220,
                              height: 120,
                              child: CupertinoTextField(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                style: TextStyles.Text,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFF1F6),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                maxLines: 6,
                              ),
                            ),
                          ],
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
                                  'Date',
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
                                  left: 115,
                                  right: 30,
                                ),
                                child: Text(
                                  'Age in Months',
                                  style: TextStyles.Text,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  left: 65,
                                  right: 30,
                                ),
                                child: Text(
                                  'Initial Vitral Signs',
                                  style: TextStyles.Text,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  left: 45,
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
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                  'Waist',
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
                                  left: 110,
                                  right: 30,
                                ),
                                child: Text(
                                  'Height in cm',
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
                                  'Weight in kg',
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
                                  'RR',
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
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  style: TextStyles.Text,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF1F6),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 175,
                                height: 35,
                                child: CupertinoTextField(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                              'Nutritional Status',
                              style: TextStyles.Text,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Radio 1
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 1,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Normal"),
                              ],
                            ),
                            // Radio 2
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 2,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Underweight"),
                              ],
                            ),
                            // Radio 3
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 3,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Severely Underweight"),
                              ],
                            ),
                            // Radio 4
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 4,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Overweight"),
                              ],
                            ),
                            // Radio 5
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 5,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Wasted"),
                              ],
                            ),
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 5,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Severely Wasted"),
                              ],
                            ),
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 5,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Stunded"),
                              ],
                            ),
                            Column(
                              children: [
                                Obx(() => Radio<int>(
                                      value: 5,
                                      groupValue:
                                          controller.selectedOption.value,
                                      onChanged: (int? value) {
                                        controller.selectedOption.value =
                                            value!;
                                      },
                                    )),
                                Text("Severely Stunded"),
                              ],
                            ),
                          ],
                        ),
                        //content
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom buttons
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Back"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text("Submit"),
                      onPressed: () {},
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
