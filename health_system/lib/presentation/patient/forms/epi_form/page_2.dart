import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/epi_form/page_3.dart';
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

void EPIFORMPAGE2(BuildContext context) {
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
          height: 390,
          child: SingleChildScrollView(
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
                              Text("EBF"),
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
                              Text("BO"),
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
                              Text("MF"),
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
                              Text("CF"),
                            ],
                          ),
                        ],
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
                        EPIFORMPAGE3(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
