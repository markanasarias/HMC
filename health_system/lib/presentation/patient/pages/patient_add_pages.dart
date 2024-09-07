import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';

void AddPatient() {
  Get.defaultDialog(
    title: "New Patient",
    titlePadding: EdgeInsets.all(0),
    contentPadding: EdgeInsets.all(0),
    content: Container(
      width: 600,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 15,
                    right: 30,
                  ),
                  child: Text(
                    'Last Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 70,
                    right: 30,
                  ),
                  child: Text(
                    'First Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 80,
                    right: 30,
                  ),
                  child: Text(
                    'Middle Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 180,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
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
                    left: 15,
                    right: 30,
                  ),
                  child: Text(
                    'Last Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 70,
                    right: 30,
                  ),
                  child: Text(
                    'First Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 80,
                    right: 30,
                  ),
                  child: Text(
                    'Middle Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 180,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
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
                    left: 15,
                    right: 30,
                  ),
                  child: Text(
                    'Last Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 70,
                    right: 30,
                  ),
                  child: Text(
                    'First Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 80,
                    right: 30,
                  ),
                  child: Text(
                    'Middle Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 180,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
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
                    left: 15,
                    right: 30,
                  ),
                  child: Text(
                    'Last Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 70,
                    right: 30,
                  ),
                  child: Text(
                    'First Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 80,
                    right: 30,
                  ),
                  child: Text(
                    'Middle Name',
                    style: TextStyles.Text1,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 185,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 180,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    style: TextStyles.Text1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'No',
                    style: TextStyles.Text,
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.offNamed('/');
                  },
                  child: Text('Yes'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
        ],
      ),
    ),
  );
}
