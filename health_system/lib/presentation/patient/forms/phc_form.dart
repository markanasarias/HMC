import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:get/get.dart';

void PHCFORM(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 700,
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
                    'PHC FORM',
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
                        'FN',
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
                        'Chief Complaint',
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
                      width: 200,
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
                      width: 360,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'S',
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
                        'BP',
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
                        'HR',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 82,
                        right: 30,
                      ),
                      child: Text(
                        'RR',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 113,
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
                      width: 120,
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
                      width: 120,
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
                      width: 150,
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
                      width: 150,
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
                        'O2sat',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 62,
                        right: 30,
                      ),
                      child: Text(
                        'HT',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 83,
                        right: 30,
                      ),
                      child: Text(
                        'WT',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 110,
                        right: 30,
                      ),
                      child: Text(
                        'WLINE',
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
                      width: 120,
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
                      width: 150,
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
                      width: 150,
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
                        'SKIN',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 340,
                        right: 30,
                      ),
                      child: Text(
                        'OTHERS',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Pallor"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Rashes"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Jaundice"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller.selectedOption.value == 3,
                            onChanged: (bool? value) {
                              if (value != null) {
                                controller.selectedOption.value = value ? 3 : 0;
                              }
                            },
                          )),
                      Text("Good skin turgor"),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 170,
                    height: 33,
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
               Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'HEENT',
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
                      height: 195,
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
                              Text("Anicteric sclerae"),
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
                              Text("Pupils briskly reactive to light"),
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
                              Text("Aural Discharge"),
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
                              Text("Tonsillopharyngeal Congestion"),
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
                              Text("Hypertrophic tonsils"),
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
                    height: 195,
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
                            Text("Intact tympanic membrane"),
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
                            Text("Alar flaring"),
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
                            Text("Nasal Discharge"),
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
                            Text("Exudates"),
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
                            Text("Palpable mass"),
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
                    'CHEST/LUNGS',
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
                              Text("Symmetrical chest expansion"),
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
                              Text("Clear breathsounds"),
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
                              Text("Retractions"),
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
                            Text("Crackles/rale"),
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
                            Text("Wheezes"),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'P',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              SizedBox(
                width: 570,
                height: 260,
                child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  style: TextStyles.Text,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF1F6),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  maxLines: 16,
                ),
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