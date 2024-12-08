import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/staff/controllers/staff_controller.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dotted_border/dotted_border.dart';
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

void AddMedicalRecord(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());
  final ItemsController itemcontroller = Get.put(ItemsController());
  final RequestStaffController controllers = Get.put(RequestStaffController());

  String? selectedItem;
  String? selecteditemname;
  String quantity = '';
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 560,
          height: 700,
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
                    'Add Medical Record',
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
                      width: 520,
                      height: 35,
                      child: CupertinoTextField(
                        controller: controller.medical_record,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 30,
                  ),
                  child: Text(
                    'File Attactment',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Obx(
                  () => controller.selectedFileName.value != null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFF1F6),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.1),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DottedBorder(
                              color: Colors.grey,
                              dashPattern: [6, 3],
                              strokeWidth: 1.0,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(5),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFF1F6),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 80,
                                      child: Icon(Icons.file_upload_outlined),
                                    ),
                                    // Expanded(
                                    //   child: Padding(
                                    //     padding: EdgeInsets.only(top: 10),
                                    //     child: Text(
                                    //       controller.selectedFileName.value!,
                                    //       style: TextStyles.Text1,
                                    //       overflow: TextOverflow.ellipsis,
                                    //     ),
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Text(
                                        controller.selectedFileName.value!,
                                        style: TextStyles.Text1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),

                                    Container(
                                      width: 70,
                                      height: 80,
                                      child: GestureDetector(
                                        onTap: controller.removeSelectedFile,
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: controller.openFileExplorer,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFEFF1F6),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.1),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: DottedBorder(
                                color: Colors.grey,
                                dashPattern: [6, 3],
                                strokeWidth: 1.0,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(5),
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Icon(Icons.file_upload_outlined),
                                    SizedBox(width: 20),
                                    Center(
                                      child: Text(
                                        'Upload File',
                                        style: TextStyles.Text1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                          SizedBox(width: 30),
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
                                var items = controller.stocks;
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
                            SizedBox(width: 30),
                            SizedBox(
                              width: 125,
                              height: 35,
                              child: CupertinoTextField(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 10),
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
                                  quantity = value;
                                },
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                print(selectedItem);
                                controllers.addItem(
                                    selectedItem!, selecteditemname!, quantity);
                                selectedItem = null;
                                quantity = '';
                                print(controller.addedItems.length);
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
                        height: 280,
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
                                    itemCount: controllers.addedItems.length,
                                    itemBuilder: (context, index) {
                                      final item =
                                          controllers.addedItems[index];
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
                                                  controllers.removeItem(item);
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
                                      final updatedItems =
                                          controllers.addedItems
                                              .map((item) => {
                                                    'item_id': item.itemid,
                                                    'itemName': item.itemName,
                                                    'quantity': item.quantity,
                                                    'branch_id': controller
                                                        .branch_id.value,
                                                  })
                                              .toList();

                                      print("Submitted Items: $updatedItems");
                                       controllers.clearFields();
                                      // controller.addmedicalrecord(
                                      //     context, updatedItems);
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
