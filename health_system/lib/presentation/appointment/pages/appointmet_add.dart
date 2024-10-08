import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void AddAppointment(BuildContext context) {
  final StaffController controller = Get.put(StaffController());
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 425,
          height: 365,
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
                    'Add Appointment',
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
                    'Name',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 385,
                      height: 35,
                      child: CupertinoTextField(
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
                        left: 20,
                        right: 30,
                      ),
                      child: Text(
                        'Start Date',
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
                        left: 95,
                        right: 30,
                      ),
                      child: Text(
                        'End Date',
                        style: TextStyles.Text,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Obx(
                      () => GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime(2015),
                                    currentDate: DateTime(2008))
                                .then((date) {
                              controller.hiredate.value =
                                  DateFormat('MMMM dd, y').format(date!);
                            });
                          },
                          child: Container(
                            width: 188,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF1F6),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 7, left: 10),
                              child: Text(controller.hiredate.value),
                            ),
                          )),
                    ),
                    SizedBox(width: 10),
                    Obx(
                      () => GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime(2015),
                                    currentDate: DateTime(2008))
                                .then((date) {
                              controller.hiredate.value =
                                  DateFormat('MMMM dd, y').format(date!);
                            });
                          },
                          child: Container(
                            width: 187,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF1F6),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 7, left: 10),
                              child: Text(controller.hiredate.value),
                            ),
                          )),
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
                    'Purpose',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 385,
                      height: 100,
                      child: CupertinoTextField(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF1F6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
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
                        //showSuccessToast(context);
                        Navigator.of(context).pop();
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
