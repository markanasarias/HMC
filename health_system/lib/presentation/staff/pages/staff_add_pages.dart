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


void AddStaff(BuildContext context) {
   final StaffController controller = Get.put(StaffController());
   final CenterController branchcontroller = Get.put(CenterController());
  showDialog(
    context: context,
      barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: 
        Container(
          width: 600,
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
             child: Padding(padding: EdgeInsets.only(left: 20, top: 12), child: Text('Add New Staff', style: TextStyles.Text4,),),
             ),
Padding(padding: EdgeInsets.all(0),child: 
          Row(
            children: [
Container(
  width: 200,
  height: 400,
  decoration: BoxDecoration(
     //color: Colors.black
  ),
  child: 
 Column( 
  mainAxisAlignment: MainAxisAlignment.start, 
  children: [
    SizedBox(height: 20,),
   Obx(() {
     final image = controller.fileAttachment.value;
    return ClipOval(
              child: controller.fileAttachment.value.isNotEmpty
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
            }
          ),
   SizedBox(height: 20,),
   GestureDetector(onTap: () {
     controller.openFileExplorer();
   },child: Container(width: 150,height: 50,
     decoration:
      BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0)
        ),
        child: Center(child: Text('Select Profile', style: TextStyles.Textwhite,),),))
    

  ],
),

),
SizedBox(width: 10,),
Container(
  width: 380,
  height: 400,
  decoration: BoxDecoration(
     //color: Colors.black
  ),
  child: Column(     mainAxisAlignment: MainAxisAlignment.start, children: [Row(
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
                    'Full Name',
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
                    'Type',
                    style: TextStyles.Text,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                //lastname
                SizedBox(
                  width: 200,
                    height: 35,
                  child: CupertinoTextField(
                    controller: controller.fullnameC,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
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
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Obx(() {
            return DropdownButtonHideUnderline(
              child: DropdownButton2(
                items: controller.role.map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(
                      role,
                      style: TextStyles.Text,
                    ),
                  );
                }).toList(),
                value: controller.selectedrole.value,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedrole.value = newValue;
                    print(controller.selectedrole.value);
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
                    left:120,
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
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 200,
                    height: 35,
                  child: CupertinoTextField(
                     controller: controller.positionC,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                  Obx(() =>  GestureDetector(onTap: () async {
                                await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1940),
                                        lastDate: DateTime(2015),
                                        currentDate: DateTime(2008))
                                    .then((date) {
                                  controller.hiredate.value =
                                      DateFormat('yyyy-MM-dd').format(date!);
                                      print(controller.hiredate.value);
                                });
                              },
                              child: Container(
                  width: 148,
                    height: 35,
                    decoration: BoxDecoration(color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),),
                  child: Padding(padding: EdgeInsets.only(top: 7, left: 10),child: 
                   Text(controller.hiredate.value),
                ),) ),),
              
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
          ),  Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 175,
                    height: 35,
                  child: CupertinoTextField(
                    controller: controller.specializationC,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                    controller: controller.medical_license_numberC,
                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                    left: 5,
                    right: 30,
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
                    left:25,
                    right: 30,
                  ),
                  child: Text(
                    'Center',
                    style: TextStyles.Text,
                  ),
                ),
              ),
             
            ],
          ),  Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 175,
                    height: 35,
                  child: CupertinoTextField(
                      controller: controller.years_of_experienceC,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
  child: Container(
    decoration: BoxDecoration(
      color: Color(0xFFEFF1F6),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButton2(
          items: branchcontroller.center.map((CenterModel center) {
            return DropdownMenuItem<String>(
              value: center.branch_id,
              child: Text(
                center.branch_name,
                style: TextStyles.Text,
              ),
            );
          }).toList(),
          value: branchcontroller.selectedBranchId.value,
          onChanged: (String? newValue) {
            if (newValue != null) {
              branchcontroller.selectedBranchId.value = newValue;
              
              controller.selectedbranch.value = branchcontroller.selectedBranchId.value;
              print( controller.selectedbranch.value);
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
                    left:90,
                    right: 30,
                  ),
                  child: Text(
                    'Email',
                    style: TextStyles.Text,
                  ),
                ),
              ),
             
            ],
          ),  Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 175,
                    height: 35,
                  child: CupertinoTextField(
                      controller: controller.phone_numberC,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                      controller: controller.emailC,
                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                    left:10,
                    right: 30,
                  ),
                  child: Text(
                    'Address',
                    style: TextStyles.Text,
                  ),
                ),
              ),
             Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
              
                SizedBox(
                  width: 360,
                    height: 35,
                  child: CupertinoTextField(
                    controller: controller.addressC,
                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
          ],
          ),
),

            ],
            ),
          ),

          
             Divider(),
             Padding(padding: EdgeInsets.only(right: 20),child: 
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
                    child: Text("Save"),
                    onPressed: () {
                      controller.addstaff(context);
                       //showSuccessToast(context);
                      // Navigator.of(context).pop();
                        //loadingform(context);
                    },
                  ),
                ],
              ),
               ),
            ],
          ),
       
        )
      );
    },
  );
}
