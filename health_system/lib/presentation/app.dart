import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:health_system/presentation/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'health Care',
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: false,
      ),
      initialRoute: '/',
      getPages: Routes.routes,
      //initialBinding: SurveyBinding(),
    );
  }
}
