import 'package:flutter/material.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_system/presentation/doctor/controllers/doctor_controllers.dart';
import 'package:health_system/presentation/patient/controllers/patient_controllers.dart';
import 'package:health_system/widget/loading_form.dart';
import 'package:health_system/widget/success.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dotted_border/dotted_border.dart';


void AddDoctor(BuildContext context) {
   final DoctorControllers controller = Get.put(DoctorControllers());
  showDialog(
    context: context,
      barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 600,
          height: 370,
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
             child: Padding(padding: EdgeInsets.only(left: 20, top: 12), child: Text('Add New Doctor', style: TextStyles.Text4,),),
             ),
Padding(padding: EdgeInsets.all(0),child: 
          Row(
            children: [
Container(
  width: 200,
  height: 265,
  decoration: BoxDecoration(
     //color: Colors.black
  ),
  child: 
 Column( 
  mainAxisAlignment: MainAxisAlignment.start, 
  children: [
    SizedBox(height: 20,),
    ClipOval(
      child: Image.asset(
        'assets/default_profile.jpg',
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover, 
      ),
    ),
   SizedBox(height: 20,),
    Container(width: 150,height: 50,
     decoration:
      BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15.0)
        ),
        child: Center(child: Text('Select Profile', style: TextStyles.Textwhite,),),)

  ],
),

),
SizedBox(width: 10,),
Container(
  width: 380,
  height: 265,
  decoration: BoxDecoration(
     //color: Colors.black
  ),
  child: Column(     mainAxisAlignment: MainAxisAlignment.start, children: [Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 5,
                    right: 30,
                  ),
                  child: Text(
                    'Full Name',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 125,
                    right: 30,
                  ),
                  child: Text(
                    'License Number',
                    style: TextStyles.Text,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                //lastname
                SizedBox(
                  width: 210,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                 SizedBox(width: 10),
                SizedBox(
                  width: 140,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 5,
                    right: 30,
                  ),
                  child: Text(
                    'Specialization',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left:90,
                    right: 30,
                  ),
                  child: Text(
                    'Year of Experience',
                    style: TextStyles.Text,
                  ),
                ),
              ),
             
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 210,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 140,
                    height: 35,
                  child: CupertinoTextField(
                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
           Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 5,
                    right: 30,
                  ),
                  child: Text(
                    'Contact',
                    style: TextStyles.Text,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left:90,
                    right: 30,
                  ),
                  child: Text(
                    'Email',
                    style: TextStyles.Text,
                  ),
                ),
              ),
             
            ],
          ),  Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                SizedBox(
                  width: 175,
                    height: 35,
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 175,
                    height: 35,
                  child: CupertinoTextField(
                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left:10,
                    right: 30,
                  ),
                  child: Text(
                    'Address',
                    style: TextStyles.Text,
                  ),
                ),
              ),
             Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
              
                SizedBox(
                  width: 360,
                    height: 35,
                  child: CupertinoTextField(
                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    style: TextStyles.Text,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFF1F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
          ),
),

            ],
            ),
          ),

          
             Divider(),
             Padding(padding: EdgeInsets.only(right: 20),child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("Save"),
                    onPressed: () {
                       showSuccessToast(context);
                       Navigator.of(context).pop();
                    
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
