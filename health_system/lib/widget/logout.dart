import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

void LogoutDialog() {
  PanaraCustomDialog.show(
    Get.context!,
    children: [
      Text(
        "Are you sure?",
        style: TextStyles.Header,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Do you want to logout?',
        style: TextStyles.Text,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          )
        ],
      ),
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    backgroundColor: Colors.white,
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    barrierDismissible: false,
  );
}
