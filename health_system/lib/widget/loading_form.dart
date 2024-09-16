import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void loadingform(BuildContext context) {
   final PatientControllers controller = Get.put(PatientControllers());
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
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.blue,
              size: 40.0,
            ),
            SizedBox(height: 20),
            Text('Loading...', style: TextStyles.Text1),
          ],
        ),
        ),
      );
    },
  );
}
