import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:health_system/presentation/patient/pages/medical_record_add.dart';
import 'package:health_system/presentation/staff/pages/doctor_add.dart';
import 'package:health_system/presentation/staff/pages/doctor_view.dart';
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
import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/center/controller/center_controller.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:convert';
import 'dart:async';
import 'package:health_system/data/model/center_model.dart';

void ViewDoctor(BuildContext context, String staff_id) {
  final StaffController controller = Get.put(StaffController());
  final CenterController branchcontroller = Get.put(CenterController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 640,
          height: 615,
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
                    'View Doctor',
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
                      print(staff_id);
                      controller.getsched(staff_id);
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
                              'SCHEDULE',
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
              Obx(() {
                if (controller.selectedTab.value == 0) {
                  return Container(
                    width: 600,
                    height: 445,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                height: 400,
                                decoration: BoxDecoration(
                                    //color: Colors.black
                                    ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Obx(() {
                                      final image =
                                          controller.fileAttachment.value;
                                      return ClipOval(
                                        child: controller
                                                .fileAttachment.value.isNotEmpty
                                            ? Image.memory(
                                                base64Decode(image),
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                'assets/default_profile.jpg',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                      );
                                    }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          controller.openFileExplorer();
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Center(
                                            child: Text(
                                              'Select Profile',
                                              style: TextStyles.Textwhite,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 380,
                                height: 445,
                                decoration: BoxDecoration(
                                    //color: Colors.black
                                    ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 0,
                                              left: 5,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Full Name',
                                              style: TextStyles.Text,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 0,
                                              left: 115,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Type',
                                              style: TextStyles.Text,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Row(
                                        children: [
                                          //lastname
                                          SizedBox(
                                            width: 200,
                                            height: 35,
                                            child: CupertinoTextField(
                                              controller: controller.fullnameC,
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
                                                    items: controller.role
                                                        .map((String role) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: role,
                                                        child: Text(
                                                          role,
                                                          style:
                                                              TextStyles.Text,
                                                        ),
                                                      );
                                                    }).toList(),
                                                    value: controller
                                                        .selectedrole
                                                        .value, // Role value comes from controller
                                                    onChanged:
                                                        (String? newValue) {
                                                      if (newValue != null) {
                                                        controller.selectedrole
                                                            .value = newValue;
                                                        print(
                                                            'Selected Role: ${controller.selectedrole.value}');
                                                      }
                                                    },
                                                    hint: Text(
                                                      'Select Role',
                                                      style: TextStyles.Text,
                                                    ),
                                                  ),
                                                );
                                              }),
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
                                              left: 5,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Position',
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
                                              left: 120,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Hire Date',
                                              style: TextStyles.Text,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            height: 35,
                                            child: CupertinoTextField(
                                              controller: controller.positionC,
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
                                          Obx(
                                            () => GestureDetector(
                                                onTap: () async {
                                                  await showDatePicker(
                                                          context: context,
                                                          firstDate:
                                                              DateTime(1940),
                                                          lastDate:
                                                              DateTime(2015),
                                                          currentDate:
                                                              DateTime(2008))
                                                      .then((date) {
                                                    controller.hiredate.value =
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(date!);
                                                    print(controller
                                                        .hiredate.value);
                                                  });
                                                },
                                                child: Container(
                                                  width: 148,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEFF1F6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 7, left: 10),
                                                    child: Text(controller
                                                        .hiredate.value),
                                                  ),
                                                )),
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
                                              left: 5,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Specialization',
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
                                              'License Number',
                                              style: TextStyles.Text,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 175,
                                            height: 35,
                                            child: CupertinoTextField(
                                              controller:
                                                  controller.specializationC,
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
                                            width: 175,
                                            height: 35,
                                            child: CupertinoTextField(
                                              controller: controller
                                                  .medical_license_numberC,
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
                                              left: 5,
                                              right: 10,
                                            ),
                                            child: Text(
                                              'Year of Experience',
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
                                              left: 0,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Center',
                                              style: TextStyles.Text,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 35,
                                            child: CupertinoTextField(
                                              controller: controller
                                                  .years_of_experienceC,
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
                                            width: 250,
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
                                                    items: branchcontroller
                                                        .center
                                                        .map((CenterModel
                                                            center) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: center.branch_id,
                                                        child: Text(
                                                          center.branch_name,
                                                          style:
                                                              TextStyles.Text,
                                                        ),
                                                      );
                                                    }).toList(),
                                                    value: branchcontroller
                                                        .selectedBranchId.value,
                                                    onChanged:
                                                        (String? newValue) {
                                                      if (newValue != null) {
                                                        branchcontroller
                                                            .selectedBranchId
                                                            .value = newValue;

                                                        controller
                                                                .selectedbranch
                                                                .value =
                                                            branchcontroller
                                                                .selectedBranchId
                                                                .value;
                                                        print(controller
                                                            .selectedbranch
                                                            .value);
                                                      }
                                                    },
                                                    hint: Text(
                                                      'Select Branch',
                                                      style: TextStyles.Text,
                                                    ),
                                                  ),
                                                );
                                              }),
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
                                              left: 5,
                                              right: 30,
                                            ),
                                            child: Text(
                                              'Contact',
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
                                              'Email',
                                              style: TextStyles.Text,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 175,
                                            height: 35,
                                            child: CupertinoTextField(
                                              controller:
                                                  controller.phone_numberC,
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
                                            width: 175,
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
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          right: 30,
                                        ),
                                        child: Text(
                                          'Address',
                                          style: TextStyles.Text,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 360,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 445,
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
                                    width: 150,
                                    height: 80,
                                    child: Center(
                                        child: Text('Day',
                                            style: TextStyles.AppBartext)),
                                  ),
                                  Container(
                                    width: 330,
                                    height: 80,
                                    child: Center(
                                        child: Text('Time',
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
                              itemCount: controller.sched.length,
                              itemBuilder: (context, index) {
                                final sched = controller.sched[index];
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
                                        width: 150,
                                        height: 80,
                                        child: Center(
                                          child: Text(sched.work_date,
                                              style: TextStyles.AppBartext),
                                        ),
                                      ),
                                      Container(
                                        width: 330,
                                        height: 80,
                                        child: Center(
                                          child: Text(sched.shift_time,
                                              style: TextStyles.AppBartext),
                                        ),
                                      ),
                                      Container(
                                        width: 118,
                                        height: 80,
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SizedBox(width: 40),
                                              IconButton(
                                                icon: Icon(Icons.visibility,
                                                    color: Colors.blue),
                                                onPressed: () {
                                                  controller.selectsched(
                                                      sched.schedule_id);
                                                  ViewSchedule(
                                                      context,
                                                      sched.schedule_id,
                                                      sched.staff_id);
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
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        controller.updateTab(0);
                        controller.getloadstaff();
                        controller.clearFields();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text("Add Schedule"),
                      onPressed: () {
                        AddSchedule(context, staff_id);
                        // controller.updateTab(0);
                        // controller.getloadstaff();
                        // controller.clearFields();
                        // Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text("Save"),
                      onPressed: () {
                        controller.updateTab(0);
                        //controller.addstaff(context);
                        //showSuccessToast(context);
                        // Navigator.of(context).pop();
                        //loadingform(context);
                        controller.updatestaff(context, staff_id);
                        // controller.clearFields();
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
