import 'package:flutter/material.dart';
import 'package:health_system/presentation/services/controller/service_controller.dart';
import 'package:health_system/presentation/services/pages/services_add_page.dart';
import 'package:health_system/presentation/services/pages/services_view.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServicesListPages extends StatelessWidget {
  const ServicesListPages({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceController controller = Get.put(ServiceController());
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AdminAppbar(title: 'Services'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Home',
                        style: TextStyles.Tableloc,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '>',
                        style: TextStyles.Text1,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Services List',
                        style: TextStyles.Tableloc,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AddServices(context);
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
                                  'Add Services',
                                  style: TextStyles.Textwhite,
                                ),
                              ),
                            ),
                          ),
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
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                                      width: 300,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Service Offered',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 380,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Schedule Days',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 180,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Schedule Time',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 118,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Action',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            // Wrap the ListView.builder with Obx
                            Obx(() => Expanded(
                              child: ListView.builder(
                                itemCount: controller.service.length,
                                itemBuilder: (context, index) {
                                  final service = controller.service[index];
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
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
                                          width: 300,
                                          height: 80,
                                          color: Colors.grey.withOpacity(0.01),
                                          child: Center(
                                            child: Text(
                                              service.service_name,
                                              style: TextStyles.AppBartext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 380,
                                          height: 80,
                                          color: Colors.grey.withOpacity(0.01),
                                          child: Center(
                                            child: Text(
                                              service.schedule_days,
                                              style: TextStyles.AppBartext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 180,
                                          height: 80,
                                          color: Colors.grey.withOpacity(0.01),
                                          child: Center(
                                            child: Text(
                                              service.schedule_time,
                                              style: TextStyles.AppBartext,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 118,
                                          height: 80,
                                          color: Colors.grey.withOpacity(0.01),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 40,
                                                ),
                                               
                                                IconButton(
                                                  icon: Icon(Icons.edit,
                                                      color: Colors.blue),
                                                  onPressed: () {
                                                    ViewServices(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )),
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
