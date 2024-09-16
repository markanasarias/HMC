import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast(BuildContext context) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    title: Text(
      'Oops!',
      style: TextStyle(
        decoration: TextDecoration.none,
        decorationColor: Colors.black,
        fontFamily:
            GoogleFonts.poppins(fontWeight: FontWeight.normal).fontFamily,
        fontSize: 12, // Reduced font size
        fontWeight: FontWeight.bold,
        color: Colors.black,
        overflow: TextOverflow.visible,
      ),
    ),
    description: RichText(
        text: TextSpan(
      text: 'Request Leave Failed',
      style: TextStyle(
        decoration: TextDecoration.none,
        decorationColor: Colors.black,
        fontFamily:
            GoogleFonts.poppins(fontWeight: FontWeight.normal).fontFamily,
        fontSize: 10, // Reduced font size for description
        fontWeight: FontWeight.w500,
        color: Colors.black,
        overflow: TextOverflow.visible,
      ),
    )),
    autoCloseDuration: const Duration(seconds: 5),
    icon: const Icon(
      Icons.check_outlined,
      color: Colors.white,
      size: 16, // Reduced icon size
    ),
    padding: const EdgeInsets.all(8.0), // Reduced padding
  );
}
