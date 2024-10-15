import 'package:flutter/material.dart';
import 'package:patient_application/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: ClipOval(
              child: Image.asset(
                'assets/default_profile.jpg',
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            )),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print("Icon button pressed");
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Full Name',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Birthday',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Birth Place',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Gender',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nationality',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Religion',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Occupation',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Religion',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Civil Status',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Address',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Email',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Emergency Contact Name',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Emergency Contact Number',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Blood Type',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Allergies',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'PhilHealth Number',
                  style: TextStyles.Text1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                //controller: controller.usernameController,
                //placeholder: 'Enter username',
                padding: EdgeInsets.symmetric(vertical: 15),
                style: TextStyles.Text1,
                decoration: BoxDecoration(
                  color: Color(0xFFEFF1F6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // child: Icon(
                  //   Icons.person_outline_outlined,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
