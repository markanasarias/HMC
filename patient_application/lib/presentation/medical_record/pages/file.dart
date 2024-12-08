import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/app/Textstyles.dart';
import 'package:patient_application/presentation/medical_record/controllers/medical_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/app/Textstyles.dart';
import 'package:patient_application/presentation/medical_record/controllers/medical_record_controller.dart';
import 'package:patient_application/presentation/medical_record/pages/file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:intl/intl.dart';
import 'dart:convert'; 
import 'dart:io'; 
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart'; // Assuming you're using GetX
import 'package:intl/intl.dart';
import 'dart:convert'; // For base64 decoding
import 'dart:io'; // For file operations
import 'package:path_provider/path_provider.dart'; // To get the temporary directory
import 'dart:typed_data';



class FileRecord extends StatelessWidget {
   final String fileName;
  final MedicalRecordController controller = Get.put(MedicalRecordController());
 FileRecord({required this.fileName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Records'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 4.0,
      ),
      body: Column(
        children: [
          Expanded(
            child:SfPdfViewer.network(
              'http://172.20.10.4:3000/patient/getfile?filename=$fileName')
          ),
        ],
      ),
    );
  }
}
