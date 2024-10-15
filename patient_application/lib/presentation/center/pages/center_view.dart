import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:patient_application/app/Textstyles.dart';

void ViewCenter(BuildContext context, String name, String location) {
  //final CenterController controller = Get.put(CenterController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'View Center',
                style: TextStyles.Header,
              ),
              Text(
                'Center Name',
                style: TextStyles.Text5,
              ),
              Text(
                name,
                style: TextStyles.Text5,
              ),
              Text(
                'Location',
                style: TextStyles.Text5,
              ),
              Text(
                location,
                style: TextStyles.Text5,
              ),
            ],
          ),
        ),
      );
    },
  );
}
