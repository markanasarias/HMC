import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/presentation/inventory/controller/request_admin/request_admin.dart';
import 'package:health_system/presentation/inventory/pages/request_admin/request_pages.dart';
import 'package:health_system/presentation/inventory/pages/request_admin/request_view_pages.dart';
import 'package:health_system/presentation/inventory/pages/stocks/inventory_add_pages.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/widget/nodata.dart';

class RequestListPages extends StatelessWidget {
  const RequestListPages({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestAdmin controller = Get.put(RequestAdmin());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.reload(); // Call the reload function
    });

    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AdminAppbar(title: 'Inventory'),
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
                        'Request Stock List',
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     print('add');
                          //     RequestInventory(context);
                          //   },
                          //   child: Container(
                          //     width: 100,
                          //     height: 40,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: Colors.blue,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Colors.black.withOpacity(0.2),
                          //           spreadRadius: 1,
                          //           blurRadius: 5,
                          //           offset: Offset(0, 3),
                          //         ),
                          //       ],
                          //     ),
                          //     child: Center(
                          //       child: Text(
                          //         'Request',
                          //         style: TextStyles.Textwhite,
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
                                      width: 100,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'ID',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Name',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Total Item',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 160,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Quantity',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Date',
                                          style: TextStyles.AppBartext,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 170,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                        child: Text(
                                          'Status',
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
                            Expanded(
                              child: Obx(() {
                                if (controller.filteredrequestsadmin.isEmpty) {
                                  return NoDataFound(); // Show this widget when no requests are found
                                } else {
                                  return ListView.builder(
                                    itemCount:
                                        controller.filteredrequestsadmin.length,
                                    itemBuilder: (context, index) {
                                      final requestsadmin = controller
                                          .filteredrequestsadmin[index];
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
                                              width: 100,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  requestsadmin.branch_id,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  requestsadmin.branch_name,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  requestsadmin.total_requests,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 160,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  requestsadmin
                                                      .total_requested_quantity,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  requestsadmin
                                                      .last_request_date,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 170,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  requestsadmin.latest_status,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 118,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 40),
                                                    IconButton(
                                                      icon: Icon(
                                                          Icons.visibility,
                                                          color: Colors.blue),
                                                      onPressed: () {
                                                        ViewRequestInventory(
                                                            context);
                                                        print(requestsadmin
                                                            .branch_id);
                                                        controller
                                                                .requestbranch_id
                                                                .value =
                                                            requestsadmin
                                                                .branch_id;
                                                        controller
                                                            .getviewrequest();
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
