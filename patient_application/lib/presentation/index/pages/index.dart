// index.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_application/presentation/center/pages/center.dart';
import 'package:patient_application/presentation/home/pages/home.dart';
import 'package:patient_application/presentation/index/controllers/index_controllers.dart';
import 'package:patient_application/presentation/login/pages/login.dart';
import 'package:patient_application/presentation/medical_record/pages/medical_record.dart';
import 'package:patient_application/presentation/profile/pages/profile.dart';
import 'package:patient_application/presentation/schedule/pages/schedule.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IndexControllers controller = Get.put(IndexControllers());

    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Portal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                controller.changePage('Home');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                controller.changePage('Profile');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_information_outlined),
              title: Text('Medical Records'),
              onTap: () {
                controller.changePage('Medical Records');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_city_outlined),
              title: Text('Centers'),
              onTap: () {
                controller.changePage('Centers');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule_outlined),
              title: Text('Schedule'),
              onTap: () {
                controller.changePage('Schedule');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        // Dynamically show the appropriate widget based on the selected page
        switch (controller.selectedPage.value) {
          case 'Home':
            return Home();
          case 'Profile':
            return Profile();
          case 'Medical Records':
            return MedicalRecords();
          case 'Centers':
            return Centers();
          case 'Schedule':
            return Schedule();
          default:
            return Center(
              child: Text(
                'Page not found!',
                style: TextStyle(fontSize: 24),
              ),
            );
        }
      }),
    );
  }
}
