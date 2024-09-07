import 'package:flutter/material.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';

class AppointmentListPages extends StatelessWidget {
  const AppointmentListPages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> patients = List.generate(
      10,
      (index) => {
        'id': '24090${index + 1}',
        'name': 'Mark Anasarias ${index + 1}',
        'age': '${20 + index}',
        'dob': '11/14/19${99 + index}',
        'gender': index % 2 == 0 ? 'Male' : 'Female',
        'contact': '09205447${10 + index}',
      },
    );
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AdminAppbar(title: 'Appointment'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Home',
                        style: TextStyles.Tableloc,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '>',
                        style: TextStyles.Text1,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Appointment List',
                        style: TextStyles.Tableloc,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('add');
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Add Patient',
                                  style: TextStyles.Textwhite,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: SizedBox(
                              height: 40,
                              width: 300,
                              child: CupertinoTextField(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                style: TextStyles.Text1,
                                placeholder: 'Search',
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFF1F6),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefix: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.1),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Material(
                              elevation: 1,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Patient ID',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Full Name',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Text(
                                      'Age',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      'Date of Birth',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      'Gender',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 65,
                                    ),
                                    Text(
                                      'Contact',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 65,
                                    ),
                                    Text(
                                      'Action',
                                      style: TextStyles.AppBartext,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: patients.length,
                                itemBuilder: (context, index) {
                                  final patient = patients[index];
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.1),
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 0.2,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          patient['id']!,
                                          style: TextStyles.AppBartext,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          patient['name']!,
                                          style: TextStyles.AppBartext,
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Text(
                                          patient['age']!,
                                          style: TextStyles.AppBartext,
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          patient['dob']!,
                                          style: TextStyles.AppBartext,
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          patient['gender']!,
                                          style: TextStyles.AppBartext,
                                        ),
                                        SizedBox(
                                          width: 65,
                                        ),
                                        Text(
                                          patient['contact']!,
                                          style: TextStyles.AppBartext,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.visibility,
                                                  color: Colors.blue),
                                              onPressed: () {},
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.edit,
                                                  color: Colors.blue),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text('<', style: TextStyles.AppBarHeader),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text('1', style: TextStyles.AppBartext),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text('>', style: TextStyles.AppBarHeader),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
