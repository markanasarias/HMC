import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:health_system/presentation/patient/pages/medical_record_add.dart';
import 'package:intl/intl.dart';
import 'dart:convert'; // For base64 decoding
import 'dart:io'; // For file operations
import 'package:path_provider/path_provider.dart'; // To get the temporary directory
import 'package:open_filex/open_filex.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';


void ViewPatient(BuildContext context, String patientid){
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
          height: 570,
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
                    'View Patient',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              // Scrollable content
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.updateTab(0);
                     
                    },
                    child: Obx(() => Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: controller.selectedTab.value == 0
                                ? Colors.blue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'INFORMATION',
                              style: controller.selectedTab.value == 0
                                  ? TextStyles.AppBartextwhite
                                  : TextStyles.AppBartext,
                            ),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.updateTab(1);
                      
                      
                      controller.getloadmedicalrecord();
                    },
                    child: Obx(() => Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: controller.selectedTab.value == 1
                                ? Colors.blue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'MEDICAL RECORD',
                              style: controller.selectedTab.value == 1
                                  ? TextStyles.AppBartextwhite
                                  : TextStyles.AppBartext,
                            ),
                          ),
                        )),
                  ),

                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Obx(() {
                if (controller.selectedTab.value == 0) {
                  return Container(
                      width: double.infinity,
                      height: 400,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                      left: 95,
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(date);
                                              controller.age.value = controller
                                                  .calculateAge(date)
                                                  .toString();
                                              print(controller.birthdayC.value);
                                              print(
                                                  "Age: ${controller.age.value}");
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEFF1F6),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 7, left: 10),
                                            child: Text(
                                                controller.birthdayC.value),
                                          ),
                                        )),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 250,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller: controller.birth_placeC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 148,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                            value:
                                                controller.selectedGender.value,
                                            onChanged: (String? newValue) {
                                              if (newValue != null) {
                                                controller.selectedGender
                                                    .value = newValue;
                                                print(controller
                                                    .selectedGender.value);
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller: controller.religionC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 150,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller: controller.occupationC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 150,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller: controller.phone_numberC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Obx(() {
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            items: controller.civilstatus
                                                .map((String status) {
                                              return DropdownMenuItem<String>(
                                                value: status,
                                                child: Text(
                                                  status,
                                                  style: TextStyles.Text,
                                                ),
                                              );
                                            }).toList(),
                                            value: controller
                                                .selectedcivilstatus.value,
                                            onChanged: (String? newValue) {
                                              if (newValue != null) {
                                                controller.selectedcivilstatus
                                                    .value = newValue;
                                                print(controller
                                                    .selectedcivilstatus.value);
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 185,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller:
                                          controller.emergency_contact_nameC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 180,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller:
                                          controller.emergency_contact_phoneC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Obx(() {
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            items: controller.bloodtype
                                                .map((String bloodtype) {
                                              return DropdownMenuItem<String>(
                                                value: bloodtype,
                                                child: Text(
                                                  bloodtype,
                                                  style: TextStyles.Text,
                                                ),
                                              );
                                            }).toList(),
                                            value: controller
                                                .selectedbloodtype.value,
                                            onChanged: (String? newValue) {
                                              if (newValue != null) {
                                                controller.selectedbloodtype
                                                    .value = newValue;
                                                print(controller
                                                    .selectedbloodtype.value);
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 180,
                                    height: 35,
                                    child: CupertinoTextField(
                                      controller: controller.philhealth_numberC,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 7, horizontal: 10),
                                      style: TextStyles.Text,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEFF1F6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]));
                } else {
                  return Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: 
                  Container(
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
              SizedBox(height: 20,),
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
                                  width: 130,
                                  height: 80,
                                  child: Center(
                                      child: Text('Record',
                                          style: TextStyles.AppBartext)),
                                ),
                                Container(
                                  width: 120,
                                  height: 80,
                                  child: Center(
                                      child: Text('File',
                                          style: TextStyles.AppBartext)),
                                ),
                                Container(
                                  width: 120,
                                  height: 80,
                                  child: Center(
                                      child: Text('Date',
                                          style: TextStyles.AppBartext)),
                                ),
                                Container(
                                  width: 110,
                                  height: 80,
                                  child: Center(
                                      child: Text('Status',
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
      final medicalrecord = controller.medicalrecord[index];
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
                child: Text('${medicalrecord.medical_record}', style: TextStyles.AppBartext),
              ),
            ),
            Container(
              width: 120,
              height: 80,
              child: Center(
                child: Text('${medicalrecord.file_name}', style: TextStyles.AppBartext),
              ),
            ),
            Container(
              width: 120,
              height: 80,
              child: Center(
                child: Text('${medicalrecord.created_date}', style: TextStyles.AppBartext),
              ),
            ),
            Container(
              width: 110,
              height: 80,
              child: Center(
                child: Text('${medicalrecord.status}', style: TextStyles.AppBartext),
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
                      icon: Icon(Icons.visibility, color: Colors.blue),
                      onPressed: () {
                        // Open the base64 file when the visibility icon is pressed
                        controller.openMedicalRecordFile(medicalrecord.file, medicalrecord.file_name);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                      controller.openMedicalRecord(medicalrecord.file, medicalrecord.file_name);
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
                  );
                }
              }),

              // Bottom buttons
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Close"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: Text("Update"),
                      onPressed: () {
                        controller.updatepatient(context, patientid);
                      },
                    ),
                    TextButton(
                      child: Text("Open Form"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                     TextButton(
                      child: Text("Upload Medical Record"),
                      onPressed: () {
                          Get.back();
                          AddMedicalRecord(context);
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
