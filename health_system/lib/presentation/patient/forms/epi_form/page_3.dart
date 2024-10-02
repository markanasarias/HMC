import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
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

void EPIFORMPAGE3(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 760,
          height: 660,
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
                      width: 277.5,
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
                        left: 175,
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
                          width: 90,
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
                          width: 90,
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
                          width: 90,
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
                          width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                              width: 90,
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
                    onPressed: () {},
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
