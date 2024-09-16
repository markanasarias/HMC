import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';

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
          width: 600,
          height: 550,
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
             child: Padding(padding: EdgeInsets.only(left: 20, top: 12), child: Text('EPI FORM', style: TextStyles.Text4,),),
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
                    'Middle Name',
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    left: 35,
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
                    left: 112,
                    right: 30,
                  ),
                  child: Text(
                    'Gender',
                    style: TextStyles.Text,
                  ),
                ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 33,
                    right: 30,
                  ),
                  child: Text(
                    'Civil Status',
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
               SizedBox(
                  width: 100,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                   width: 120,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 80,
                    right: 30,
                  ),
                  child: Text(
                    'Contact Number',
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
                    'Email',
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    'Address',
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
                    left: 105,
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
                    left: 0,
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 185,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    left: 80,
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
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 185,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
          SizedBox(height: 10,),
        Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    // Radio 1
    Column(
      children: [
        Obx(() => Radio<int>(
              value: 1,
              groupValue: controller.selectedOption.value,
              onChanged: (int? value) {
                controller.selectedOption.value = value!;
              },
            )),
        Text("Form 1"),
      ],
    ),
    // Radio 2
    Column(
      children: [
        Obx(() => Radio<int>(
              value: 2,
              groupValue: controller.selectedOption.value,
              onChanged: (int? value) {
                controller.selectedOption.value = value!;
              },
            )),
        Text("Form 2"),
      ],
    ),
    // Radio 3
    Column(
      children: [
        Obx(() => Radio<int>(
              value: 3,
              groupValue: controller.selectedOption.value,
              onChanged: (int? value) {
                controller.selectedOption.value = value!;
              },
            )),
        Text("Form 3"),
      ],
    ),
    // Radio 4
    Column(
      children: [
        Obx(() => Radio<int>(
              value: 4,
              groupValue: controller.selectedOption.value,
              onChanged: (int? value) {
                controller.selectedOption.value = value!;
              },
            )),
        Text("Form 4"),
      ],
    ),
    // Radio 5
    Column(
      children: [
        Obx(() => Radio<int>(
              value: 5,
              groupValue: controller.selectedOption.value,
              onChanged: (int? value) {
                controller.selectedOption.value = value!;
              },
            )),
        Text("Form 5"),
      ],
    ),
  ],
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
                    child: Text("Save"),
                    onPressed: () {
                       showSuccessToast(context);
                      // Navigator.of(context).pop();
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
