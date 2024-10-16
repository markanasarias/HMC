import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/inventory/controller/request_admin/request_admin.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';

void ViewRequestInventory(BuildContext context) {
  final RequestAdmin controller = Get.put(RequestAdmin());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 600,
          height: 525,
          child: Column(
            children: <Widget>[
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
                    'Request Inventory',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      //content

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
                                      width: 50,
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
                                      width: 290,
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
                                      width: 150,
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
                                      width: 50,
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
                              child: Obx(
                                () => ListView.builder(
                                  itemCount:
                                      controller.viewrequestsadmin.length,
                                  itemBuilder: (context, index) {
                                    final viewrequestsadmin =
                                        controller.viewrequestsadmin[index];
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
                                            width: 50,
                                            height: 80,
                                            color:
                                                Colors.grey.withOpacity(0.01),
                                            child: Center(
                                              child: Text(
                                                viewrequestsadmin.item_id,
                                                style: TextStyles.AppBartext,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 290,
                                            height: 80,
                                            color:
                                                Colors.grey.withOpacity(0.01),
                                            child: Center(
                                              child: Text(
                                                viewrequestsadmin.item_name,
                                                style: TextStyles.AppBartext,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 150,
                                            height: 80,
                                            color:
                                                Colors.grey.withOpacity(0.01),
                                            child: Center(
                                              child: SizedBox(
                                                width: 100,
                                                height: 35,
                                                child: CupertinoTextField(
                                                  controller: TextEditingController(
                                                      text: viewrequestsadmin
                                                          .requested_quantity), // Set the initial value from requested_quantity
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 7,
                                                    horizontal: 10,
                                                  ),
                                                  style: TextStyles.AppBartext,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEFF1F6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 80,
                                            color:
                                                Colors.grey.withOpacity(0.01),
                                            child: Center(
                                              child: IconButton(
                                                icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.red),
                                                onPressed: () {
                                                  print(viewrequestsadmin
                                                      .request_id);
                                                  controller.reject(
                                                      context,
                                                      viewrequestsadmin
                                                          .request_id);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //content
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
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
                      child: Text("Approved"),
                      onPressed: () {
                        print(controller.Quantity.text);
                        controller.approvedrequest(context);
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
