import 'package:flutter/material.dart';
import 'package:health_system/data/api/logs.dart';
import 'package:health_system/presentation/logs/controller/logs_controller.dart';
import 'package:health_system/widget/admin_appbar.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QueueDisplay extends StatelessWidget {
  const QueueDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    //final LogsController controller = Get.put(LogsController());
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 500,
              height: 100,
              child: Center(
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 85,
                        maxWidth: 85,
                      ),
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Muntinlupa Health Department',
                      style: TextStyles.Header,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              width: 500,
              height: 100,
              child: Center(
                child: Text(
                  'Branch: Poblacion Poblacion',
                  style: TextStyles.Header,
                ),
              ))
        ]),
        SizedBox(
          height: 100,
        ),
        Container(
          width: 400,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border(
              bottom: BorderSide(
                color: Colors.blue,
                width: 10.0,
              ),
              left: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
              right: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
              top: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Now Serving',
                style: TextStyles.Queue,
              ),
              SizedBox(
                height: 30,
              ),
              // Text(
              //   'OPD',
              //   style: TextStyles.Header,
              // ),
              Text(
                '20',
                style: TextStyles.Number,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
