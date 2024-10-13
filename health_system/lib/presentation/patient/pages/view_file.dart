import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart'; // Assuming you're using GetX
import 'package:health_system/app/Textstyles.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:intl/intl.dart';
import 'dart:convert'; // For base64 decoding
import 'dart:io'; // For file operations
import 'package:path_provider/path_provider.dart'; // To get the temporary directory
import 'package:open_file/open_file.dart';
import 'dart:typed_data';


void ViewFile(BuildContext context, String pdffilename) async {
  final PatientControllers controller = Get.put(PatientControllers());

  print(pdffilename);
  print('success');
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 640,
          height: 570,
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
                    'View File Record',
                    style: TextStyles.Text4,
                  ),
                ),
              ),
              // PDF Viewer
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SfPdfViewer.file(
              File('C:/HMC/HMC/health_system/assets/$pdffilename'))
              ),
              // Bottom buttons
              Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: Text("Close"),
                      onPressed: () {
                        controller.updateTab(0);
                        Get.back();
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

