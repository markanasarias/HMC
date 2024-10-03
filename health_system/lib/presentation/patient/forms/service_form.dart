import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:get/get.dart';

void SERVICEFORM(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 1000,
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
                    'SERVICE FORM',
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              'Medical History',
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
                                Text("Hypertension"),
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
                                Text("Heart Disease"),
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
                                Text("Diabetes"),
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
                                Text("Bleeder"),
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
                                Text("Allergy"),
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
                                Text("Asthma"),
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
                                Text("Epilepsy"),
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
                                  'Under Medication',
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
                                  left: 315,
                                  right: 30,
                                ),
                                child: Text(
                                  'Others',
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
                                width: 460,
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
                                width: 460,
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
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 30,
                            ),
                            child: Text(
                              'Oral Health Status',
                              style: TextStyles.Textbold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'A. Check if Present and X if absent',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Date of Oral Examination',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Dental Caries',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Gingivitis/Periodontal Disease',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Debris',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Calculus',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Abnormal Growth',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Cleft Lip/Cleft Palate',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Others(Supernumerary/mesiodens)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'B. Indicate Number',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Permanent Teeth Present',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Permanent Sounds Present',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Decayed Teeth (D)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Missing Teeth (M)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Filled Teeth (F)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Teeth for Extraction  (X)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Temporary Teeth Present',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Temporary Sounds Teeth',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Decayed Teeth  (d)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Filled Teeth (f)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of Teeth for Extraction (x)',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No. of dfx Teeth',
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
                                            'Age',
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
                                            'Age',
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
                                            'Age',
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
                                            'Age',
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
                                            'Age',
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
