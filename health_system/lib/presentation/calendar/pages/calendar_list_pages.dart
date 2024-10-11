import 'package:flutter/material.dart';
import 'package:health_system/presentation/calendar/controller/calendar_controller.dart';
import 'package:health_system/presentation/calendar/pages/calendar_add.dart';
import 'package:health_system/presentation/calendar/pages/calendar_details.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarListPages extends StatelessWidget {
  const CalendarListPages({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.put(CalendarController());

    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AdminAppbar(title: 'Calendar'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Home', style: TextStyles.Tableloc),
                      SizedBox(width: 5),
                      Text('>', style: TextStyles.Text1),
                      SizedBox(width: 5),
                      Text('Calendar', style: TextStyles.Tableloc),
                      SizedBox(width: 772),
                      GestureDetector(
                        onTap: () {
                          print('add');
                          AddCalendar(context);
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyles.Textwhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 525,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 20, vertical: 10),
                    child: MonthView(
                      controller: controller.eventController,
                      minMonth: DateTime(2020),
                      maxMonth: DateTime(2030),
                      initialMonth: DateTime.now(),
                      cellAspectRatio: 2.5,
                      onPageChange: (DateTime date, int pageIndex) {},
                      onCellTap: (events, date) {
                        if (events.isNotEmpty) {
                          // Format the date to 'yyyy-MM-dd'
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(date);
                          print("Selected date: $formattedDate");
                          controller.selectevents(formattedDate);
                          Calendar_details(context);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
