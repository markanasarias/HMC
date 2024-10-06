import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

Future<void> Alert({required String title, required String text}) async {
  return await PanaraCustomDialog.show(
    Get.context!,
    children: [
      Text(
        title,
        style: TextStyles.Header,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          text,
          style: TextStyles.Text,
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Okay'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      )
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    backgroundColor: Colors.white,
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    barrierDismissible: false,
  );
}
