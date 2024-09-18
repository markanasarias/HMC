import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/presentation/patient/forms/phc_form/page_1.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';

void PHCPage4(BuildContext context) {
  final PatientControllers controller = Get.put(PatientControllers());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 600,
          height: 400,
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
                    'PHC FORM',
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
                    'P',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              SizedBox(
                width: 570,
                height: 260,
                child: CupertinoTextField(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  style: TextStyles.Text,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF1F6),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  maxLines: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row(
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
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
