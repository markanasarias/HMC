import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/epi_form.dart';
import 'package:health_system/presentation/patient/forms/phc_form.dart';
import 'package:health_system/presentation/patient/forms/prenatal_form.dart';
import 'package:health_system/presentation/patient/forms/service_form.dart';
import 'package:health_system/widget/loading_form.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void AddPatient(BuildContext context) {
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
          width: 645,
          height: 500,
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
                    'Add New Patient',
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
                        left: 40,
                        right: 30,
                      ),
                      child: Text(
                        'Last Name',
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
                        left: 90,
                        right: 30,
                      ),
                      child: Text(
                        'First Name',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 90,
                        right: 30,
                      ),
                      child: Text(
                        'Middle Name (optional)',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: [
                    //lastname
                    SizedBox(
                      width: 185,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.last_nameC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    //firstname
                    SizedBox(
                      width: 185,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.first_nameC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    //middlename
                    SizedBox(
                      width: 180,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.middle_nameC,
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
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 40,
                        right: 30,
                      ),
                      child: Text(
                        'Birthday',
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
                        right: 30,
                      ),
                      child: Text(
                        'Birth Place',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 162,
                        right: 30,
                      ),
                      child: Text(
                        'Gender',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              firstDate: DateTime(1940),
                              lastDate: DateTime(2015),
                              currentDate: DateTime(2008),
                            ).then((date) {
                              if (date != null) {
                                controller.birthdayC.value =
                                    DateFormat('yyyy-MM-dd').format(date);
                                controller.age.value =
                                    controller.calculateAge(date).toString();
                                print(controller.birthdayC.value);
                                print("Age: ${controller.age.value}");
                              }
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF1F6),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 7, left: 10),
                              child: Text(controller.birthdayC.value),
                            ),
                          )),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 240,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.birth_placeC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 158,
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
                                  print(controller.selectedGender.value);
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
                    //   SizedBox(width: 10),
                    //  SizedBox(
                    //     width: 110,
                    //       height: 35,
                    //     child: CupertinoTextField(
                    //         padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    //       style: TextStyles.Text,
                    //       decoration: BoxDecoration(
                    //         color: Color(0xFFEFF1F6),
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //   ),
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
                        left: 40,
                        right: 30,
                      ),
                      child: Text(
                        'Nationality',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        'Religion',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 50,
                        right: 30,
                      ),
                      child: Text(
                        'Accupation',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 55,
                        right: 30,
                      ),
                      child: Text(
                        'Contact',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.nationalityC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
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
                        controller: controller.religionC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
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
                        controller: controller.occupationC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
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
                        controller: controller.phone_numberC,
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
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 40,
                        right: 30,
                      ),
                      child: Text(
                        'Civil Status',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 57,
                        right: 30,
                      ),
                      child: Text(
                        'Complete Address',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
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
                              items:
                                  controller.civilstatus.map((String status) {
                                return DropdownMenuItem<String>(
                                  value: status,
                                  child: Text(
                                    status,
                                    style: TextStyles.Text,
                                  ),
                                );
                              }).toList(),
                              value: controller.selectedcivilstatus.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedcivilstatus.value =
                                      newValue;
                                  print(controller.selectedcivilstatus.value);
                                }
                              },
                              hint: Text(
                                '',
                                style: TextStyles.Text,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 412,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.addressC,
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
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 40,
                        right: 30,
                      ),
                      child: Text(
                        'Email (Optional)',
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
                        left: 48,
                        right: 20,
                      ),
                      child: Text(
                        'Emergency Contact Name',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 5,
                        right: 30,
                      ),
                      child: Text(
                        'Emergency Contact',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: [
                    SizedBox(
                      width: 185,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.emailC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                        controller: controller.emergency_contact_nameC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                        controller: controller.emergency_contact_phoneC,
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
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 40,
                        right: 30,
                      ),
                      child: Text(
                        'Blood Type',
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
                        left: 83,
                        right: 30,
                      ),
                      child: Text(
                        'Allergies',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 115,
                        right: 30,
                      ),
                      child: Text(
                        'PhilHealth Number',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  children: [
                    SizedBox(
                      width: 185,
                      height: 35,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Obx(() {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              items:
                                  controller.bloodtype.map((String bloodtype) {
                                return DropdownMenuItem<String>(
                                  value: bloodtype,
                                  child: Text(
                                    bloodtype,
                                    style: TextStyles.Text,
                                  ),
                                );
                              }).toList(),
                              value: controller.selectedbloodtype.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedbloodtype.value = newValue;
                                  print(controller.selectedbloodtype.value);
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
                      width: 185,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.allergiesC,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                        controller: controller.philhealth_numberC,
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        controller.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text("Save"),
                      onPressed: () {
                        controller.addpatient(context);
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
