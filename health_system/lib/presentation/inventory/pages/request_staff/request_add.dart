import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/inventory/controller/items/items_controller.dart';
import 'package:health_system/presentation/inventory/controller/request_staff/request_staff.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

void RequestStaff(BuildContext context) {
  final ItemsController itemcontroller = Get.put(ItemsController());
  final RequestStaffController controller = Get.put(RequestStaffController());
  String? selectedItem;
  String? selecteditemname;
  String quantity = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 600,
          height: 605,
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
                    'Add Inventory',
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
                      // Content
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 0,
                                right: 30,
                              ),
                              child: Text(
                                'Name',
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
                                left: 180,
                                right: 30,
                              ),
                              child: Text(
                                'Quantity',
                                style: TextStyles.Text,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 250,
                              height: 35,
                              child: Obx(() {
                                var items = itemcontroller.item;
                                List<DropDownValueModel> dropDownItems =
                                    items.map((item) {
                                  return DropDownValueModel(
                                      name: item.item_name,
                                      value: item.item_id);
                                }).toList();

                                return DropDownTextField(
                                  clearOption: true,
                                  enableSearch: true,
                                  clearIconProperty:
                                      IconProperty(color: Colors.black),
                                  searchTextStyle:
                                      const TextStyle(color: Colors.black),
                                  searchDecoration: const InputDecoration(
                                      hintText: "Enter Item Name"),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  dropDownItemCount: dropDownItems.length,
                                  dropDownList: dropDownItems,
                                  onChanged: (val) {
                                    selectedItem = val.value;
                                    selecteditemname = val.name;
                                    print('Selected item: ${val.name}');
                                  },
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                           SizedBox(
  width: 125,
  height: 35,
  child: CupertinoTextField(
    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
    style: TextStyles.Text,
    decoration: BoxDecoration(
      color: Color(0xFFEFF1F6),
      borderRadius: BorderRadius.circular(10.0),
    ),
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
    ],
    onChanged: (value) {
      if (int.tryParse(value) != null && int.parse(value) > 1000) {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Limit Exceeded'),
              content: Text('The maximum value allowed is 1000.'),
              actions: [
                CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        quantity = value;
      }
    },
  ),
),

                            SizedBox(width: 75),
                            GestureDetector(
                              onTap: () {
                                print(selectedItem);
                                controller.addItem(
                                    selectedItem!, selecteditemname!, quantity);
                                selectedItem = null;
                                quantity = '';
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
                      ),
                      SizedBox(height: 10),
                      // ListView to display added items
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
                            SizedBox(height: 5),
                            Expanded(
                              child: Obx(() => ListView.builder(
                                    itemCount: controller.addedItems.length,
                                    itemBuilder: (context, index) {
                                      final item = controller.addedItems[index];
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.5),
                                        child: Container(
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
                                                width: 50,
                                                height: 80,
                                                color: Colors.grey
                                                    .withOpacity(0.01),
                                                child: Center(
                                                  child: Text(
                                                    item.itemid,
                                                    style:
                                                        TextStyles.AppBartext,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 290,
                                                height: 80,
                                                color: Colors.grey
                                                    .withOpacity(0.01),
                                                child: Center(
                                                  child: Text(
                                                    item.itemName,
                                                    style:
                                                        TextStyles.AppBartext,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 150,
                                                height: 80,
                                                color: Colors.grey
                                                    .withOpacity(0.01),
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 35,
                                                    child: CupertinoTextField(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical: 7,
                                                        horizontal: 10,
                                                      ),
                                                      style:
                                                          TextStyles.AppBartext,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEFF1F6),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly,
                                                      ],
                                                      controller:
                                                          TextEditingController(
                                                        text: item.quantity
                                                            .toString(),
                                                      ),
                                                      onChanged: (value) {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.removeItem(item);
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 80,
                                                  color: Colors.grey
                                                      .withOpacity(0.01),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )),
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
                                    child: Text("Submit"),
                                    onPressed: () {
                                      // List<Map<String, dynamic>> itemsList =
                                      //     controller.addedItems
                                      //         .map((item) => item.toJson())
                                      //         .toList();
                                      // print(itemsList);
                                    
                                      controller.addrequest(context);
                                        controller.addedItems.clear();
                                    },
                                  ),
                                ],
                              ),
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
      );
    },
  );
}
