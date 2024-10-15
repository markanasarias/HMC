import 'package:flutter/material.dart';
import 'package:patient_application/app/Textstyles.dart';

class MedicalRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: 10,
            itemBuilder: (context, index) {
              //final activity = controller.recentactivies[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 11),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.medical_information_outlined,
                                color: Colors.black,
                                size: 40,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 85.0, top: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check Up',
                              style: TextStyles.Text1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 85.0, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '10/15/2024',
                              style: TextStyles.Text3,
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 330.0, top: 28),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Icon(
                      //         Icons.arrow_forward_ios,
                      //         color: Colors.black,
                      //         size: 25,
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
