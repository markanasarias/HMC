import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/no_data.png',
                width: 70,
                height: 70,
              ),
              const SizedBox(height: 20),
              SizedBox(width: 20),
              const Text(
                'No data found!',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}