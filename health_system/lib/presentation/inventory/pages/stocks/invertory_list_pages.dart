import 'package:flutter/material.dart';
import 'package:health_system/presentation/center/controller/center_controller.dart';
import 'package:health_system/presentation/inventory/controller/stocks/stocks_controller.dart';
import 'package:health_system/presentation/inventory/pages/stocks/inventory_add_pages.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:health_system/data/model/center_model.dart';
import 'package:health_system/widget/nodata.dart';

class InvertoryListPages extends StatelessWidget {
  const InvertoryListPages({super.key});

  @override
  Widget build(BuildContext context) {
    final StocksController controller = Get.put(StocksController());
    final CenterController branchcontroller = Get.put(CenterController());
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
                      Text('Inventory List', style: TextStyles.Tableloc),
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
                          // GestureDetector(
                          //   onTap: () {
                          //     print('add');
                          //     AddInventory(context);
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
                          //       child: Text('Add Inventory',
                          //           style: TextStyles.Textwhite),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: 420,
                          ),
                          //if (controller.type.value == 'Admin')
                          if (controller.usertype.value == 'Admin')
                            SizedBox(
                              width: 220,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFF1F6),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Obx(() {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      items: branchcontroller.center
                                          .map((CenterModel center) {
                                        return DropdownMenuItem<String>(
                                          value: center.branch_id,
                                          child: Text(
                                            center.branch_name,
                                            style: TextStyles.Text,
                                          ),
                                        );
                                      }).toList(),
                                      value: branchcontroller
                                          .selectedBranchId.value,
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          branchcontroller.selectedBranchId
                                              .value = newValue;

                                          controller.selectedbranch.value =
                                              branchcontroller
                                                  .selectedBranchId.value;
                                          print(
                                              controller.selectedbranch.value);

                                          controller.getloadstocks(
                                              controller.selectedbranch.value);
                                        }
                                      },
                                      hint: Text(
                                        'Select Branch',
                                        style: TextStyles.Text,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          SizedBox(
                            width: 10,
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
                                      width: 100,
                                      height: 80,
                                      color: Colors.grey.withOpacity(0.01),
                                      child: Center(
                                          child: Text('ID',
                                              style: TextStyles.AppBartext)),
                                    ),
                                    Container(
                                      width: 550,
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
                                          child: Text('Quantity',
                                              style: TextStyles.AppBartext)),
                                    ),
                                    Container(
                                      width: 100,
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
                                if (controller.filteredstocks.isEmpty) {
                                  return NoDataFound(); // Show this widget when no stocks are found
                                } else {
                                  return ListView.builder(
                                    itemCount: controller.filteredstocks.length,
                                    itemBuilder: (context, index) {
                                      final stocks =
                                          controller.filteredstocks[index];
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
                                                  stocks.item_id,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 550,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  stocks.item_name,
                                                  style: TextStyles.AppBartext,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 200,
                                              height: 80,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Center(
                                                child: Text(
                                                  stocks.quantity,
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
                                                  stocks.purchase_date,
                                                  style: TextStyles.AppBartext,
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
