import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/phc_form/page_1.dart';
import 'package:health_system/presentation/patient/forms/phc_form/page_4.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';

void PHCPage3(BuildContext context) {
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
          height: 590,
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
                    'PHC FORM',
                    style: TextStyles.Text4,
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
                    'ABDOMEN',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Container(
                      width: 285,
                      height: 130,
                      //color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Flat"),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Flabby"),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Tenderness"),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OTHERS',
                                style: TextStyles.Text,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 200,
                                height: 33,
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 285,
                    height: 130,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.selectedOption.value == 3,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.selectedOption.value =
                                          value ? 3 : 0;
                                    }
                                  },
                                )),
                            Text("Globular"),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.selectedOption.value == 3,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.selectedOption.value =
                                          value ? 3 : 0;
                                    }
                                  },
                                )),
                            Text("Muscle Guarding"),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.selectedOption.value == 3,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.selectedOption.value =
                                          value ? 3 : 0;
                                    }
                                  },
                                )),
                            Text("Palpable Mass"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
                    'EXTREMITIES',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Container(
                      width: 285,
                      height: 65,
                      //color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Gross deformity"),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Full and equal pulses"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 285,
                    height: 65,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.selectedOption.value == 3,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.selectedOption.value =
                                          value ? 3 : 0;
                                    }
                                  },
                                )),
                            Text("Normal gait"),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'OTHERS',
                              style: TextStyles.Text,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 200,
                              height: 33,
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
                      ],
                    ),
                  ),
                ],
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
                    'HEART',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Container(
                      width: 285,
                      height: 97,
                      //color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Adynamic Precordium"),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(() => Checkbox(
                                    value: controller.selectedOption.value == 3,
                                    onChanged: (bool? value) {
                                      if (value != null) {
                                        controller.selectedOption.value =
                                            value ? 3 : 0;
                                      }
                                    },
                                  )),
                              Text("Normal rate regular rhythm"),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'OTHERS',
                                style: TextStyles.Text,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 200,
                                height: 33,
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 285,
                    height: 97,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.selectedOption.value == 3,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.selectedOption.value =
                                          value ? 3 : 0;
                                    }
                                  },
                                )),
                            Text("Heaves/thrills"),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.selectedOption.value == 3,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      controller.selectedOption.value =
                                          value ? 3 : 0;
                                    }
                                  },
                                )),
                            Text("Murmurs"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
                    'Assessment',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              SizedBox(
                width: 570,
                height: 65,
                child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  style: TextStyles.Text,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF1F6),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text("Back"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text("Next"),
                    onPressed: () {
                      PHCPage4(context);
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
