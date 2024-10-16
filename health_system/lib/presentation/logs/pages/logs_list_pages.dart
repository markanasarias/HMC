import 'package:flutter/material.dart';
import 'package:health_system/data/api/logs.dart';
import 'package:health_system/presentation/logs/controller/logs_controller.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_system/widget/nodata.dart';

class LogsListPages extends StatelessWidget {
  const LogsListPages({super.key});

  @override
  Widget build(BuildContext context) {
    final LogsController controller = Get.put(LogsController());
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AdminAppbar(title: 'Logs'),
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
                      Text('Logs List', style: TextStyles.Tableloc),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 475,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: SizedBox(
                              height: 40,
                              width: 300,
                              child: CupertinoTextField(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                style: TextStyles.Text1,
                                placeholder: 'Search',
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFF1F6),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefix: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(Icons.search,
                                      color: Color(0xFF9E9E9E)),
                                ),
                                onChanged: (value) {
                                  controller.searchQuery.value = value;
                                  controller.filterPatients();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.1),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Material(
                              elevation: 1,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                          child: Text('ID',
                                              style: TextStyles.AppBartext)),
                                    ),
                                    Container(
                                      width: 310,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                          child: Text('Action',
                                              style: TextStyles.AppBartext)),
                                    ),
                                    Container(
                                      width: 310,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                          child: Text('Name',
                                              style: TextStyles.AppBartext)),
                                    ),
                                    Container(
                                      width: 200,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                          child: Text('Date',
                                              style: TextStyles.AppBartext)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Obx(() {
                                if (controller.filteredlogs.isEmpty) {
                                  return NoDataFound();
                                } else {
                                  return ListView.builder(
                                    itemCount: controller.filteredlogs.length,
                                    itemBuilder: (context, index) {
                                      final logs =
                                          controller.filteredlogs[index];
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                              width: 0.2,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                  child: Text(logs.log_id,
                                                      style: TextStyles
                                                          .AppBartext)),
                                            ),
                                            Container(
                                              width: 310,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                  child: Text(logs.action,
                                                      style: TextStyles
                                                          .AppBartext)),
                                            ),
                                            Container(
                                              width: 310,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                  child: Text(logs.fullname,
                                                      style: TextStyles
                                                          .AppBartext)),
                                            ),
                                            Container(
                                              width: 200,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                  child: Text(logs.created_at,
                                                      style: TextStyles
                                                          .AppBartext)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
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
