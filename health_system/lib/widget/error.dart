import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

void showErrorToast(BuildContext context, {required String title, required String text}) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    title: Text(
      title,
      style: TextStyle(
        decoration: TextDecoration.none,
        decorationColor: Colors.black,
        fontFamily:
            GoogleFonts.poppins(fontWeight: FontWeight.normal).fontFamily,
        fontSize: 12, 
        fontWeight: FontWeight.bold,
        color: Colors.black,
        overflow: TextOverflow.visible,
      ),
    ),
    description: RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          decoration: TextDecoration.none,
          decorationColor: Colors.black,
          fontFamily:
              GoogleFonts.poppins(fontWeight: FontWeight.normal).fontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          overflow: TextOverflow.visible,
        ),
      ),
    ),
    autoCloseDuration: const Duration(seconds: 5),
    icon: const Icon(
      Icons.close_outlined, 
      color: Colors.white,
      size: 16, 
    ),
    padding: const EdgeInsets.all(8.0),
  );
}
