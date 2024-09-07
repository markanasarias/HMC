import 'package:flutter/material.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:cell_calendar/cell_calendar.dart';

class CalendarListPages extends StatelessWidget {
  const CalendarListPages({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 10),
                      child: MonthView(
                        controller: EventController(),
                        minMonth: DateTime(2020),
                        maxMonth: DateTime(2030),
                        initialMonth: DateTime.now(),
                        cellAspectRatio: 1.5,
                        onPageChange: (DateTime date, int pageIndex) {
                          // Handle page change
                        },
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
