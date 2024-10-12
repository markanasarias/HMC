import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/appointment/controllers/appointment_controllers.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void ViewAppointment(BuildContext context, String appointment_id) {
  final AppointmentControllers controller = Get.put(AppointmentControllers());
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
          height: 430,
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
                    'View Appointment',
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
                        controller: controller.doctorname,
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        style: TextStyles.Text,
                        readOnly: true, // Makes the field disabled
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
                            print('Yes');
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (selectedDate != null) {
                              TimeOfDay? selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (selectedTime != null) {
                                // Combine the selected date and time
                                DateTime combinedDateTime = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );

                                // Format the combined DateTime as needed
                                final formattedDateTime =
                                    "${combinedDateTime.toLocal()}";

                                controller.startdate.value = formattedDateTime;
                                // If you want to store the full datetime as well, you can store combinedDateTime directly or format it
                              }
                            }
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
                              child: Text(controller.startdate.value),
                            ),
                          )),
                    ),
                    SizedBox(width: 9),
                    Obx(
                      () => GestureDetector(
                          onTap: () async {
                            print('Yes');
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );

                            if (selectedDate != null) {
                              TimeOfDay? selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (selectedTime != null) {
                                // Combine the selected date and time
                                DateTime combinedDateTime = DateTime(
                                  selectedDate.year,
                                  selectedDate.month,
                                  selectedDate.day,
                                  selectedTime.hour,
                                  selectedTime.minute,
                                );

                                // Format the combined DateTime as needed
                                final formattedDateTime =
                                    "${combinedDateTime.toLocal()}";

                                controller.enddate.value = formattedDateTime;
                                // If you want to store the full datetime as well, you can store combinedDateTime directly or format it
                              }
                            }
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
                              child: Text(controller.enddate.value),
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
                        controller: controller.purpose,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'Status',
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
                        controller: controller.StatusC,
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
                        controller.updateappointment(context, appointment_id);
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
