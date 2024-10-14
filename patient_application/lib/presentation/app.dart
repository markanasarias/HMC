import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:patient_application/presentation/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Application',
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: false,
      ),
      initialRoute: '/',
      getPages: Routes.routes, // Access static property correctly
      //initialBinding: SurveyBinding(),
    );
  }
}
